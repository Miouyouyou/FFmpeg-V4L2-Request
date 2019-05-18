About
-----

This script compiles FFmpeg with @Kwiboo , @jernejsk and @ezequielgarcia patches
providing V4L2-Request API support.

This is currently used to test WIP Rockchip VPU drivers.

Usage
-----

## Compilation

```bash
bash ./compile.sh
```

## Installation

The script doesn't automatically install FFmpeg. The reason is that installing
FFmpeg like this could conflict with your current installation, since the
installer creates `libav*` and `libsw*` `.so` symlinks, leading to the new
libraries.
This won't create an issue for applications linked against the .so.XYZ version,
but this might lead to a huge mess when dealing with applications linked against
.so libraries.

```bash
cd ffmpeg &&
sudo make install
```

