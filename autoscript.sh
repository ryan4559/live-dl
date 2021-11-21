#!/bin/bash

# Auto install last version of youtube-dl, chat-downloader and twspace-dl for docker image
pip install --no-cache-dir --upgrade --quiet youtube-dl chat-downloader twspace-dl

# Auto install last version of ytarchive
curl -o /usr/src/app/ytarchive.py https://raw.githubusercontent.com/Kethsar/ytarchive/master/ytarchive.py

# Run main script
bash /usr/src/app/config/auto.sh

# Run Youtube-dl Web GUI
python -u /usr/src/app/youtube-dl-server.py
