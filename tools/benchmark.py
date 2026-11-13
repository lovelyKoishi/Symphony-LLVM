#!/usr/bin/env python3
"""Check general workloads against host C, then collect target execution metrics."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
from symphony_machine import Machine, assemble

ROOT = Path(__file__).resolve().parents[1]
CASES = ('arithmetic', 'branches', 'arrays', 'calls', 'recursion', 'strings', 'io', 'memory')

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--backend', type=Path, default=ROOT/'build/llvm2symphony')
    p.add_argument('--opt', choices=('0', '1', '2', '3'), default='1')
    p.add_argument('--output', type=Path, required=True)
    p.add_argument('--compare', type=Path, help='compare with a saved report at the same -O level')
    p.add_argument('--runtime-dir',type=Path,default=ROOT/'runtime',
                   help='runtime source snapshot for compiler/library comparisons')
    args = p.parse_args()
    records = []
    with tempfile.TemporaryDirectory() as tmp:
        tmp = Path(tmp)
        host = tmp/'host.c'
        host.write_text('#include <stdio.h>\nunsigned bench(unsigned);\n'
                        'void symphony_out(unsigned v){(void)v;}\n'
                        'int main(void){printf("%u\\n",bench(123));}\n')
        target = tmp/'entry.c'
        target.write_text('unsigned bench(unsigned); int main(void){return bench(123);}\n')
        for case in CASES:
            source = ROOT/'benchmarks'/f'{case}.c'
            exe = tmp/'reference'
            subprocess.run(['cc','-std=c11','-O1','-fsanitize=undefined',
                            '-fno-sanitize-recover=undefined',str(host),str(source),'-o',str(exe)],check=True)
            expected = int(subprocess.check_output([str(exe)],text=True))
            asm = tmp/'target.asm'
            command = [sys.executable,str(ROOT/'tools/symphony-cc'),str(target),str(source),
                       '-O'+args.opt,'--backend',str(args.backend.resolve()),'-o',str(asm)]
            if case in ('strings','memory'):
                runtime_sources = [str(args.runtime_dir/'tty.c')]
                if (args.runtime_dir/'tty_ascii8.c').is_file():
                    runtime_sources.append(str(args.runtime_dir/'tty_ascii8.c'))
                runtime_sources.extend(str(args.runtime_dir/'libc'/name) for name in
                                       ('string.c','ctype.c','stdlib.c','num.c','stdio.c'))
                command[4:4] = runtime_sources
            subprocess.run(command,check=True)
            program = assemble(asm.read_text())
            machine = Machine(program,profile=True)
            result = machine.run(5_000_000)
            if result.reason != 'breakpoint' or result.exit_code != expected:
                raise AssertionError(f'{case}: expected {expected}, got {result}')
            if machine.registers[14] != (1<<24) or machine.registers[13] != 0:
                raise AssertionError(f'{case}: SP/frame pointer not restored')
            if case == 'io':
                assert machine.outputs == [(123+i)^(i<<3) for i in range(64)]
            data_start = min((int(line.split(' = ')[1]) for line in asm.read_text().splitlines()
                              if line.startswith('; ') and ' = ' in line),default=1<<24)
            code_bytes = max(address+4 for address in program.source_map if address < data_start)
            record = dict(case=case, checksum=expected, instructions=result.steps,
                          source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                          code_bytes=code_bytes, image_bytes=len(program.image), **machine.stats)
            records.append(record)
            print(f'{case}: {result.steps:,} instructions, '
                  f'{record["loads"]+record["stores"]:,} data accesses, '
                  f'{code_bytes} code bytes, {record["max_stack_bytes"]} stack bytes',flush=True)
    report = dict(opt=args.opt,seed=123,
                  backend_sha256=hashlib.sha256(args.backend.read_bytes()).hexdigest(),
                  runtime_sha256=hashlib.sha256(b''.join(p.read_bytes() for p in
                                              sorted(args.runtime_dir.rglob('*.c')))).hexdigest(),cases=records)
    if args.compare:
        previous = json.loads(args.compare.read_text())
        if previous['opt'] != args.opt or previous['seed'] != 123:
            raise ValueError('comparison requires the same optimization level and seed')
        old_cases = {r['case']:r for r in previous['cases']}
        for row in records:
            old = old_cases.get(row['case'])
            if old is None:
                print(f'{row["case"]}: no baseline (new workload)',flush=True)
                continue
            if (row['checksum'],row['source_sha256']) != (old['checksum'],old['source_sha256']):
                raise ValueError('comparison requires unchanged benchmark source and result')
            print(f'{row["case"]}: instruction change '
                  f'{100*(row["instructions"]/old["instructions"]-1):+.1f}%',flush=True)
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(report,indent=2)+'\n')

if __name__ == '__main__': main()
