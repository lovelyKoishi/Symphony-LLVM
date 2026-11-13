# 已移植的上游程序

## donut.c：旋转 ASCII 甜甜圈

这是 Andy Sloane（a1k0n）的定点整数版 donut.c，采用 LiteX 仓库中的实现作为上游快照。它是已有程序的平台移植，而不是另写一个甜甜圈演示后沿用原名。

- [作者的原始整数版](https://gist.github.com/a1k0n/80f48aa8911fffd805316b8ba8f48e83)
- [作者对整数旋转的说明](https://www.a1k0n.net/2021/01/13/optimizing-donut.html)
- [固定版本的 LiteX 源码](https://github.com/enjoy-digital/litex/blob/c2cceb84723ac892b65ea39557b75efd9564f6b7/litex/soc/software/demo/donut.c)
- [本地上游快照](../third_party/litex_donut/donut.c)、[许可证](../third_party/litex_donut/LICENSE)、[SHA-256 与来源](../third_party/litex_donut/SOURCE.json)
- [Symphony 移植源码](../ports/donut.c)

### 编译与运行

```bash
python3 tools/symphony-cc ports/donut.c --libc -O3 \
  --data-base 0x8000 --stack-top 0x10000 -o asm/donut.asm
```

在游戏中打开生成的 `donut.asm`。使用 ASCII8 96×40 显示，原始 80×22 画面居中。键盘使用 Localized 模式；按 Q 或 Esc 会在当前帧结束后退出到启动代码的稳定循环。退出后最后一帧保留。

程序持续计算旋转，不依赖预计算画面、外部坐标、浮点数、sin/cos 或数学库。

### 保留与适配的部分

原有的 90×324 双层采样循环、10 位定点旋转/归一化、透视投影、光照和有符号 8 位深度缓冲保留。仅将部分原来依赖运算符优先级的表达式加上等价括号，保持计算顺序。

平台改动：

1. `void donut()` 改为合法的 `int main(void)`。
2. 移除 LiteX 的 console.h、UART 非阻塞读取及 ANSI 向上移动光标。
3. 用两个 96×40 字符 framebuffer 呈现结果，切换 screen 的数据偏移；初始显示另一块空缓冲，避免首次复制直接改写可见画面。
4. 用 Symphony 键盘事件处理 Q/Esc；不使用 getchar 的规范行缓冲来退出动画。
5. 不使用 POSIX sleep，按 CPU 能达到的速度更新。没有宣称在实际游戏电路上达到某个帧率。
6. 增加 `DONUT_FRAMES` 测试选项，默认 0 表示无限动画，测试时可固定帧数。

原始浮点版需要 math/浮点支持，当前后端不能原样编译它。这里明确选用作者已有的整数版本；也没有借此宣称已经支持一般桌面应用或完整 POSIX 环境。

### 对上游做差分验证

[test_donut.py](../tests/test_donut.py) 做了以下验证：

- 直接包含本地**未修改的上游源文件**，只替换终端输出和循环停止 hook，在主机 C 编译器上开启 UBSan，生成第 1、2 帧的参考文本与深度缓冲。
- 将 Symphony 版本用 `--libc -O1 -DDONUT_FRAMES=2` 编译成 LLVM IR，再装配为真正的 Symphony 机器字。
- 用参考执行器完整执行两帧，比较两个 framebuffer 中的 1760 个字符，并比较第二帧 1760 字节的深度缓冲。
- 验证两帧不同，确认旋转状态实际更新；验证 SP 恢复及最终显示缓冲选择。

用户确认机器时钟为 **11 MHz**。两帧实测共 24,290,313 条基础指令；若每条指令为一个周期，前两帧平均约 **1.10 秒/帧，即 0.91 FPS**。这是按指令数换算的估值，不是实际游戏帧率测量。

本机两帧测试约执行 **2430 万条基础机器指令**。这说明当前后端虽然能运行真实整数渲染程序，性能仍受栈访存等开销限制。软件模拟耗时不等于游戏电路的帧率。

```bash
# 单独运行较慢的上游差分测试，需主机 cc 和 UBSan 支持
ctest --test-dir build -R '^donut$' --output-on-failure

# 快速运行其他回归
ctest --test-dir build -LE slow --output-on-failure
```

CTest 的普通及低地址输出在 `build/validation/donut`、`build/validation/donut-low-memory`，单帧输出在 `build/validation/donut-static`：两个实际目标帧、最终 framebuffer、有限帧汇编及指令计数。PNG 预览由目标执行器产生的字符缓冲绘制，使用主机等宽字体；不冒充游戏自身字体的截图。

### 游戏黑屏时的单帧排查

用户报告动画版在当前电路一直黑屏；前述软件差分通过不表示已经在真实电路验证成功。目前尚未确认黑屏原因。

提供两种独立文件：

- `donut_frame_display.asm`：**显示自检**，把已验证的第一帧作为数据加载，只执行 12 条设置指令后固定显示。不使用栈、函数调用、旋转或除法；显存固定 0x8000。这是预渲染样张，不能当作硬件上计算出了甜甜圈的证据。
- `donut_static.asm`：**真实单帧计算**，显示 `Rendering one frame...` 与 ring 采样进度，计算完成后显示 `Frame ready.` 并固定画面，不继续旋转。全局数据从 0x8000 开始、空栈顶为 0x10000，运行时访问控制在低 64 KiB；这是一种排查布局，不是断言当前硬件只有 64 KiB。

```bash
python3 tools/symphony-cc ports/donut.c --libc -O1 \
  -DDONUT_FRAMES=1 -DDONUT_DIAGNOSTICS=1 \
  --data-base 0x8000 --stack-top 0x10000 -o asm/diagnostics/donut_static.asm

python3 tests/test_donut.py --single-frame --artifacts build/examples
python3 tools/make_donut_display.py build/examples/donut_static_frame.txt \
  -o asm/diagnostics/donut_frame_display.asm
```

单帧计算结果与上游首帧及深度缓冲逐字节相同，约执行 814 万条基础指令。单帧常量状态使 Clang 能做更多常量折叠，因此指令数小于连续动画的平均帧。显示自检文件则不等待渲染，可以先用它确认加载和显示路径。

### 实际电路的排查进展

用户随后确认：显示自检和低地址单帧计算版**都能在实际电路正常运行**。这确认了这两条路径的显示、采样计算与低地址内存布局可用。

原高地址动画仍曾出现黑屏，尚不能据此断言是 RAM 容量、地址线、加载范围还是其他硬件/布局差异。动画版现改用同一低地址布局，仍保留两帧缓冲和持续旋转；需要在实际电路重新加载验证动画。

新的低地址差分测试会把参考执行器主存缩到 65536 字节，不做高地址折回，以检查是否意外访问 64 KiB 之外。两帧图像和深度缓冲仍与上游对比。

```bash
python3 tests/test_donut.py --low-memory --diagnostics --artifacts build/examples
```

用户实机复测低地址连续动画仍然黑屏，因此低地址布局并未解决问题。当前 `donut.asm` 启用 `DONUT_DIAGNOSTICS=1`：启动先显示 `Rendering...`，显示 `frame NN ring NN / 90` 进度，完成后显示 `Frame ready.`。状态写入使用 volatile，字体选项显式设为 0。它仍执行完整的旋转计算；需要根据实际显示的最后状态继续定位。诊断双帧测试同时检查昂贵渲染之前已有可见提示，及两帧图像/深度与上游一致。

随后实机反馈：帧号和 ring 进度持续变化，但看不到甜甜圈。说明不能把该现象继续称为程序整体停住。诊断版增加 `hits`（通过坐标和深度测试的写入次数）、`ink`（b 缓冲内非空格且非零字符数）、`copyerr`（复制到显示缓冲后的字节不一致数）、第一个采样点的 x/y/N，以及可见的亮度字符表。数值均为八位十六进制。它们用于实机与参考执行器对照，不代表已确定硬件故障。

该诊断版在参考执行器通过双帧差分（30,134,317 条指令）。第 0 帧：hits=000008C4 ink=00000226 copyerr=00000000，x=00000028 y=00000015 N=FFFFFFF8；第 1 帧：hits=00000956 ink=00000222 copyerr=00000000，x=00000028 y=00000014 N=FFFFFFF8。`donut_probe.asm` 为 `DONUT_FRAMES=2` 的已验证测试产物，计算两帧后保留最后画面，方便实机读取上述第二组数值。它不使用预渲染画面。

实机截图 Screenshot_20261108_190541.png：第二帧 hits=00000001 ink=00000001 copyerr=000005A1；x=00000028 y=0000000C N=00000000，字符表正常可见。与参考执行器的几何和统计值均不同。copyerr 的索引计算本身也使用乘除法，不能单凭此值断言 memcpy 有缺陷。新增 `tools/make_alu_probe.py` 生成 `alu_probe.asm`：21 项 add/mul/div/mod，分别验证不同目标、目标覆盖左输入、目标覆盖右输入，包含 1024×3072、0xFFFFFFFF×1024 和 47185920÷5242880 等定点渲染值。测试无 C 后端、无栈；十六进制输出无乘除余，运行 2046 条指令即可固定显示 GOT/EXPECT。参考执行器全通过，实机尚待反馈；未确定具体电路原因。

### 硬件修复与编译器优化后的状态

用户运行 ALU probe 的截图显示 7×9 正确，但 1024×3072 及 0xFFFFFFFF×1024 均错误地返回零，覆盖两种输入寄存器的情况与独立目的寄存器一致；截图里的除法测试通过。用户随后确认发现乘法电路位宽设计错误，已修正，并确认连续旋转甜甜圈在实机运行，但速度较慢。因此此前不能归因于内存布局，且不需要软件乘法替代。

后端优化后进行相同 `--low-memory`、无诊断统计、前两帧的差分验证：

| 后端/前端等级 | 两帧基础指令数 | 相对旧后端 O1 的减少 |
| --- | ---: | ---: |
| 优化前 O1 | 24,155,038 | — |
| 优化后 O1 | 14,123,389 | 41.53% |
| 优化后 O2 | 14,123,379 | 41.53% |
| 优化后 O3 | 14,122,103 | 41.54% |

三种优化等级均通过两个字符帧和深度缓冲逐字节比对；还检查栈恢复。主要收益来自后端，O2/O3 在该例的额外收益很小。这是目标执行器的指令数，不能声称是实机测得的帧率；不同实验并行运行，Python 执行耗时不用于性能结论。按每条一周期、11 MHz 估算，新版前两帧平均约 0.64 秒/帧，实际以电路运行表现为准。当前游戏 `donut.asm` 使用 O3 且关闭诊断统计；旧的诊断动画另存为 `donut_debug.asm`。

可重复对比命令（`--backend` 可指定保留的旧后端）：

```bash
python3 tests/test_donut.py --low-memory --opt 1 --artifacts build/optimized
python3 tests/test_donut.py --low-memory --opt 2 --artifacts build/optimized-O2
python3 tests/test_donut.py --low-memory --opt 3 --artifacts build/optimized-O3
```

工作区清理后，游戏中曾验证的汇编已迁移到项目 `asm/`，诊断程序在 `asm/diagnostics/`；历史优化段落所说的“游戏 donut.asm”指迁移前位置，当前不再把这些文件写入电路目录。旧预览在 `docs/previews/`，临时验证结果可按上文命令重建。
