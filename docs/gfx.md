# 2D 图形库

接口：[include/gfx.h](../include/gfx.h)，实现：[runtime/gfx.c](../runtime/gfx.c)。编译加 `--gfx`，运行时以独立 C 源文件编译、IR 链接；后端只保留程序实际引用的函数。

固定使用 **Pixel8、128×96**，每像素一字节，颜色格式 **RRRGGGBB**。没有浮点、三角函数或外部运行时依赖。这里不提供面填充、旋转或三维投影。

## 使用

```c
#include "gfx.h"

int main(void) {
    gfx_rect(8, 8, 112, 80, GFX_WHITE);
    gfx_line(8, 8, 119, 87, GFX_GREEN);
    gfx_pixel(64, 48, GFX_YELLOW);
    gfx_init();
    return 0;
}
```

```bash
python3 tools/symphony-cc examples/gfx_demo.c --gfx -O1 -o asm/gfx_demo.asm
python3 tools/symphony-cc examples/cube.c --gfx -O1 -o asm/cube.asm
```

坐标原点为左上角，x 向右、y 向下，有效像素为 x=0..127、y=0..95。坐标、矩形尺寸参数使用 `int16_t`，范围 −32768..32767；颜色参数为 `uint8_t`。运算在 32 位整数上完成。调用者应在转换为这些参数类型之前处理更大范围的坐标。

## 五个接口

| 接口 | 行为 |
| --- | --- |
| `gfx_init()` | 配置 Pixel8、分辨率参数 31 和库的 framebuffer；不清空已有像素 |
| `gfx_clear(color)` | 将整个 framebuffer 写成指定颜色，用于下一次重绘 |
| `gfx_pixel(x, y, color)` | 写一个像素；越界时无动作 |
| `gfx_line(x0, y0, x1, y1, color)` | 先裁剪再用整数 Bresenham 光栅化，包含两端点；完全不可见时无动作 |
| `gfx_rect(x, y, width, height, color)` | 只画矩形边框，右下边界为 x+width−1、y+height−1；尺寸非正时无动作 |

矩形裁剪只保留真实可见的边，不把视口边界伪造为新矩形边。单像素、单行、单列矩形有效。画线使用 Cohen–Sutherland 裁剪，避免远处端点导致数万次无效逐点绘制；整数交点按向零取整处理。

裁剪插值的乘积用无符号 32 位计算，因输入坐标范围可证明两个因子均不超过 65535，其乘积不会溢出 u32。Bresenham 只处理裁剪后的屏幕内端点。

## 初始化和显示

framebuffer 初始依赖目标的零 RAM 约定，不会在生成文件尾部展开 12288 个零，也不会在 `gfx_init()` 里做无意义的首次清屏。

可先绘制再调用 `gfx_init()`，一次显示完成的静态画面；也可先初始化再边画边显示。库直接写显存，没有双缓冲、垂直同步或独立的 present 操作。重绘时按需要显式 `gfx_clear()`。

TTY 和 GFX 各自有私有 framebuffer，可同时以 `--tty --gfx` 链接，但显示器同一时刻只能显示一种模式。使用图形时由 `gfx_init()` 接管；需要返回字符终端时显式调用 `tty_init()`。不要在二者之间假定自动恢复模式。

## 颜色

头文件提供 `GFX_BLACK`、`GFX_RED`、`GFX_GREEN`、`GFX_BLUE`、`GFX_YELLOW`、`GFX_MAGENTA`、`GFX_CYAN`、`GFX_WHITE`。

自定义颜色按 3 位红、3 位绿、2 位蓝打包：

```c
uint8_t color = (red3 << 5) | (green3 << 2) | blue2;
/* red3/green3: 0..7；blue2: 0..3。 */
```

这不是 ASCII8 屏幕设置中的 24 位 `0xRRGGBB`。

## 示例

- [gfx_demo.c](../examples/gfx_demo.c)：彩色线段、矩形边框与像素。
- [cube.c](../examples/cube.c)：复用 `gfx_line` 绘制 12 条棱，无面填充；点位仍是预先给定的投影坐标，不在硬件上计算旋转。

正方体迁移前后 framebuffer 逐字节一致。软件测试不能代替游戏硬件上的最后一次显示检查。
