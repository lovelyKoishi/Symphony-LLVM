# 从持久磁盘显示原始图片

另有 [通用 BMP 查看器](bmp-viewer.md)，可直接解析 BMP 并自动识别尺寸；本页仍描述无头 Pixel32 bin 路径。

使用用户确认的 **16,777,216 字节（16 MiB）持久磁盘**。程序不解析 BMP、PNG、JPEG 或文件系统，也不读文件头；主机生成器把图片转换为硬件可直接显示的像素数据，并可生成匹配的汇编程序。

- C 源码：[image_viewer.c](../examples/image_viewer.c)
- 转换器：[image_to_bin.py](../tools/image_to_bin.py)
- 测试图片：[test_pattern.bin](../images/test_pattern.bin)
- 匹配程序：[image_viewer.asm](../asm/image_viewer.asm)
- 配置说明：[test_pattern.json](../images/test_pattern.json)
- [测试图预览](../images/test_pattern.png)：左上红、右上绿、左下蓝、右下白。

## 先运行测试图

1. 将 `images/test_pattern.bin` 按原始字节加载到电路的 **Persistent Memory，从地址 0 开始**。
2. 在程序编辑器打开本项目 `asm/image_viewer.asm`，运行。
3. 应显示 128×96 的四色图。程序结束后在启动代码停驻，画面保留；它不会写入磁盘。

测试 bin 只有 49,152 字节，不必填满 16 MiB。若导入工具要求整盘长度，可使用后述 `--pad-disk`。

## 转换自己的图片

主机端依赖 Pillow（当前环境已有）：

```bash
python3 -m pip install -r requirements-images.txt
python3 tools/image_to_bin.py photo.png -o images/photo.bin --asm asm/photo.asm
```

将生成的 bin 加载到持久磁盘地址 0，再运行配套 asm。分辨率、复制长度和磁盘偏移是编译期常量，**换图时应使用生成器产生的配套程序**。JSON 是给用户查看的记录，机器程序不读取它。

PNG/JPEG/BMP 等源文件由主机 Pillow 解码；模拟机器只复制转换后的数据。源图片不被覆盖，透明部分合成在黑底上，EXIF 方向在转换时应用。

## 分辨率

不固定为 128×96。默认选择能容纳图片的最小硬件 4:3 网格：

```text
k = min(256, max(ceil(width/4), ceil(height/3)))
screen = (4*k) × (3*k)
setting = k-1
```

不放大小图；有多余空间时居中留黑边。图片过大时保持比例缩小到最大 1024×768 范围。也可显式选择设置，例如：

```bash
python3 tools/image_to_bin.py photo.jpg --resolution 63 -o images/photo.bin --preview images/photo-preview.png --asm asm/photo.asm
```

参数 63 对应 256×192。预览为转换后的实际画布，而非未转换原图。

## 磁盘与像素布局

Pixel32 每像素 4 字节，按从上到下、从左到右排列：

```text
R G B 00
```

最后一个字节是填充，不是透明度。CPU 及 RAM 多字节值为大端：红色像素为 `0xff000000`。程序用 pload 读取一个完整磁盘 word，store_32 原样写入 framebuffer，不做颜色转换。

磁盘偏移默认 0，可指定 4 字节对齐偏移；生成的 bin 自带该偏移之前的零前缀，仍从磁盘地址 0 导入：

```bash
python3 tools/image_to_bin.py photo.png --disk-offset 0x1000 -o images/photo.bin --asm asm/photo.asm
# 如需生成恰好 16 MiB 的整盘镜像：
python3 tools/image_to_bin.py photo.png --pad-disk -o images/photo.bin --asm asm/photo.asm
```

生成器及 C 静态断言都检查偏移与像素数据不超过磁盘。默认文件只有必要的前缀和像素；填满整盘必须显式指定 --pad-disk。

主内存 framebuffer 固定放在 `0x00400000`，最大占 3,145,728 字节，结束于 `0x00700000`，避开当前独立程序及其栈。它不声明巨大初始化数组，不在汇编末尾展开零或把图片嵌进程序。设置屏幕后逐 word 复制，加载过程可逐步看到图像。

## 验证

`tests/test_image_viewer.py` 验证真实机器字执行后的 framebuffer 与预期像素逐字节相同，包括 RGB 顺序、扫描方向、非零偏移、磁盘末尾精确边界、显存保护字节、只读磁盘、栈恢复，以及生成器的透明度、黑边、缩放、容量与输入覆盖检查。测试图的生成 bin、配套 asm 也一起执行验证。

```bash
ctest --test-dir build -R '^image_viewer$' --output-on-failure
```

这是参考执行器验证；尚未声称在用户实际电路导入磁盘并显示成功。
