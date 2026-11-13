#!/usr/bin/env python3
"""Convert images to headerless Symphony Pixel32 disk data and a matching viewer."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
DISK_BYTES = 16777216

def convert(image, resolution=None):
    from PIL import Image, ImageOps
    source = ImageOps.exif_transpose(image).convert('RGBA')
    original = source.size
    if resolution is None:
        factor = min(256,max((source.width+3)//4,(source.height+2)//3))
        resolution = factor-1
    if not 0 <= resolution <= 255:
        raise ValueError('resolution must be 0..255')
    width,height = 4*(resolution+1),3*(resolution+1)
    source.thumbnail((width,height),Image.Resampling.LANCZOS)
    x,y = (width-source.width)//2,(height-source.height)//2
    canvas = Image.new('RGBA',(width,height),(0,0,0,255))
    canvas.alpha_composite(source,(x,y))
    canvas = canvas.convert('RGB')
    pixels = bytearray(canvas.convert('RGBA').tobytes())
    pixels[3::4] = bytes(width*height) # Padding byte, not alpha.
    return bytes(pixels),canvas,dict(width=width,height=height,resolution=resolution,
                                    source_size=list(original),draw_size=list(source.size),
                                    draw_offset=[x,y])

def test_pattern():
    from PIL import Image
    image = Image.new('RGB',(128,96))
    colors = ((255,0,0),(0,255,0),(0,0,255),(255,255,255))
    for y in range(96):
        for x in range(128): image.putpixel((x,y),colors[(y>=48)*2+(x>=64)])
    return image

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('input',type=Path,nargs='?',help='PNG/JPEG/BMP or another Pillow-supported image')
    p.add_argument('--test-pattern',action='store_true',help='use a built-in 128x96 color chart')
    p.add_argument('-o','--output',type=Path,required=True,help='binary disk image, loaded starting at disk byte 0')
    p.add_argument('--resolution',type=int,help='screen setting 0..255; default smallest fitting 4:3 screen')
    p.add_argument('--disk-offset',type=lambda s:int(s,0),default=0)
    p.add_argument('--pad-disk',action='store_true',help='pad to the full 16 MiB disk size')
    p.add_argument('--preview',type=Path,help='optional PNG preview of the converted pixels')
    p.add_argument('--asm',type=Path,help='also compile a matching viewer to this .asm path')
    p.add_argument('--backend',type=Path,default=ROOT/'build/llvm2symphony')
    args=p.parse_args()
    if bool(args.input)==args.test_pattern:p.error('choose an input image OR --test-pattern')
    if args.disk_offset < 0 or args.disk_offset & 3:p.error('--disk-offset must be nonnegative and word aligned')
    outputs=[args.output,args.output.with_suffix('.json')]
    if args.preview:outputs.append(args.preview)
    if args.asm:outputs.append(args.asm)
    paths=[path.resolve() for path in outputs]
    if len(paths)!=len(set(paths)):p.error('output paths must be different')
    if args.input and args.input.resolve() in paths:p.error('outputs must not overwrite the input image')
    try:
        from PIL import Image
        if args.test_pattern:
            pixels,canvas,info=convert(test_pattern(),args.resolution)
        else:
            with Image.open(args.input) as image:
                pixels,canvas,info=convert(image,args.resolution)
        end=args.disk_offset+len(pixels)
        if end>DISK_BYTES:raise ValueError('image and offset exceed the 16 MiB disk')
        with tempfile.TemporaryDirectory() as tmp:
            compiled=Path(tmp)/'viewer.asm'
            if args.asm:
                subprocess.run([sys.executable,str(ROOT/'tools/symphony-cc'),
                                str(ROOT/'examples/image_viewer.c'),'-O1',
                                '-DIMAGE_RESOLUTION='+str(info['resolution']),
                                '-DIMAGE_DISK_OFFSET='+str(args.disk_offset),
                                '--backend',str(args.backend.resolve()),'-o',str(compiled)],check=True)
            for path in outputs:path.parent.mkdir(parents=True,exist_ok=True)
            with args.output.open('wb') as out:
                out.seek(args.disk_offset)
                out.write(pixels)
                if args.pad_disk:out.truncate(DISK_BYTES)
            info.update(format='Pixel32: R,G,B,0; top-to-bottom rows; no header',
                        disk_offset=args.disk_offset,pixel_bytes=len(pixels),
                        disk_capacity=DISK_BYTES,disk_image_bytes=args.output.stat().st_size,
                        framebuffer_address='0x00400000',pixel_sha256=hashlib.sha256(pixels).hexdigest())
            args.output.with_suffix('.json').write_text(json.dumps(info,indent=2)+'\n')
            if args.preview:canvas.save(args.preview,format='PNG')
            if args.asm:args.asm.write_bytes(compiled.read_bytes())
        print(f'{info["width"]}x{info["height"]}, {len(pixels)} pixel bytes, disk offset {args.disk_offset}')
        print('BIN:',args.output)
        if args.asm:print('ASM:',args.asm)
    except (OSError,ValueError,subprocess.CalledProcessError) as exc:
        p.exit(1,f'image_to_bin: {exc}\n')
    except ImportError:
        p.exit(1,'image_to_bin: Pillow is required (python3 -m pip install Pillow)\n')

if __name__=='__main__':main()
