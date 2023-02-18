#!/bin/bash

# Auto install last version of youtube-dl and chat-downloader for docker image
pip install --no-cache-dir --upgrade --quiet yt-dlp chat-downloader

# Auto install last version of ytarchive
curl -sLo /usr/src/app/ytarchive.zip https://github.com/Kethsar/ytarchive/releases/download/latest/ytarchive_linux_amd64.zip
unzip -q -o /usr/src/app/ytarchive.zip -d /usr/local/bin
rm /usr/src/app/ytarchive.zip

# Run main script
bash /usr/src/app/config/auto.sh

# Run Youtube-dl Web GUI
python -u /usr/src/app/youtube-dl-server.py
