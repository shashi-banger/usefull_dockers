#Simple transcoding example
docker run --rm -v /home2/sb_media:/home/root/media/ ubuntu_ffmpeg ffmpeg -i media/ChevyCruze_30s_ts.ts -t 10 -vcodec h264 -acodec libfdk_aac -vb 1000000 -s 480x270 media/tmp.ts

# Generate wav file
docker run --rm -v /home2/sb_media:/home/root/media/ ubuntu_ffmpeg ffmpeg -i media/ChevyCruze_30s_ts.ts media/c.wav

#Generate normalized wav
ffmpeg$ docker run --rm -v /home2/sb_media:/home/root/media/ ubuntu_ffmpeg ffmpeg-normalize media/ChevyCruze_30s_ts.ts -t -30 -o media/n_c.wav
