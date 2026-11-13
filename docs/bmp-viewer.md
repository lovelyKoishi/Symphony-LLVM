# 通用 BMP 查看器

程序：[asm/bmp_viewer.asm](../asm/bmp_viewer.asm)，源码：[examples/bmp_viewer.c](../examples/bmp_viewer.c)。它在 Symphony CPU 上解析磁盘中的 BMP 文件，自动选择分辨率；不同图片使用同一个程序，无需按图片尺寸重新编译。

## 使用

1. 将完整 BMP 文件（包含 BM 文件头）按原始字节导入 **Persistent Memory 的地址 0**。
2. 运行项目中的 `asm/bmp_viewer.asm`。
3. 换图后重新运行同一个程序即可。程序只读磁盘，图像完成后保留在屏幕。

测试文件 [test_pattern.bmp](../images/test_pattern.bmp) 是 128×96 的 24 位 BMP。导入后应显示四色图。

若导入界面只显示 bin 扩展名，可复制 BMP 为 .bin 后导入，内容不变、文件头保留：

```bash
cp images/test_pattern.bmp build/test_pattern_bmp.bin
```

其他格式可用图片编辑器另存为未压缩的 24 位 BMP。

## 支持范围

- Windows DIB 头长度 40、108、124 字节。
- 24 位 BGR 或 32 位 BGRX，compression=BI_RGB（0）、planes=1；32 位的第四字节忽略，不做 alpha 混合。
- 正高度 bottom-up、负高度 top-down；处理行末 4 字节对齐填充和文件指定的像素起始偏移。
- 宽、高各 1..65535；整个文件及像素区必须在当前 16 MiB 磁盘范围内。
- 小图保持原尺寸、居中黑边；大图保持比例缩小到 1024×768 范围，使用整数最近邻采样。画布选择能容纳结果的最小 4:3 网格。

不支持调色板 1/4/8 位、16 位、RLE、BI_BITFIELDS 掩码、嵌入 PNG/JPEG、OS/2 CORE 头及色彩配置文件处理。遇到不支持或无效头部会切回字符屏显示错误，不把数据继续当像素渲染。

这些文件格式规则依据 Microsoft 的 [BITMAPFILEHEADER](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader)、[BITMAPINFOHEADER 与 stride](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader)、[bitmap storage](https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage)、[RGBTRIPLE](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-rgbtriple) 文档。上述支持范围是本实现的子集，不代表实现了全部 BMP 变体。

## 内存与磁盘

BMP 字段按小端解码；磁盘 pload 与 RAM word 仍按大端工作。像素读取采用对齐 word 拼接提取 B/G/R，再转换成屏幕所需的 R/G/B/0。最后几个文件字节可能读取其所在完整 word，但不会跨越物理磁盘末尾；不要求 BMP 长度是 4 的倍数。

显存固定在主内存 0x00400000，最大区域到 0x00700000（不含），与代码和栈分开。每次按实际画布清理背景，避免缩小图片后残留旧图；没有在程序末尾放入巨大的初始化数组或图片本身。

当前没有文件系统，默认读取磁盘偏移 0 的一个 BMP。若改变文件存放位置，可重新编译一次设置 BMP_DISK_OFFSET，之后仍可更换任意受支持尺寸的 BMP：

```bash
python3 tools/symphony-cc examples/bmp_viewer.c --tty -O1 -o asm/bmp_viewer.asm
# 例如另一个固定磁盘位置：
python3 tools/symphony-cc examples/bmp_viewer.c --tty -O1 -DBMP_DISK_OFFSET=4096 -o asm/bmp_viewer_4096.asm
```

`bfSize` 是无文件系统情况下的文件长度依据。程序可验证它与像素区、物理磁盘的关系，但不能凭原始磁盘判断是否只导入了文件的一部分而剩余区域仍是旧数据；导入时须使用完整文件。
