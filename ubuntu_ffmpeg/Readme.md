
Lib264 download path:
http://launchpadlibrarian.net/353997222/libx264-152_0.152.2854+gite9a5903-2_amd64.deb


Ffmpeg Download path:
https://github.com/FFmpeg/FFmpeg/archive/n4.0.2.tar.gz

Ffmpeg build configuration
```
./configure --enable-static --disable-shared --enable-libfreetype --extra-cflags=--static --enable-gpl --enable-libx264 --enable-nonfree --enable-libfdk_aac

make all; make install DEST_DIR=ffmpeg_4.02_release
  
tar -zcvf ffmpeg_4.02_release.tgz ffmpeg_4.02_release
```

docker build -t ubuntu_ffmpeg .
