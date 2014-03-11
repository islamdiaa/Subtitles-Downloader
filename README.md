subtitles_downloader
====================

Subtitles Downloader

Ruby script to download subtitles of any Movie/TV series from SubDB. The API of the SubDB is used to download the subtitles by hashing the first 64 bytes with the last 64 bytes of the video into MD5 and then requesting the subtitles using this hash. All you need is to specifiy the path of the video and the script will download the subtitle and place it next to the video location and add the ".srt" extension.
