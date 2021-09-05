#!/bin/bash

# Auto install last version of youtube-dl and chat-downloader
pip install --no-cache-dir --upgrade --quiet youtube-dl chat-downloader

# Auto install last version of ytarchive
curl -o /usr/src/app/ytarchive.py https://raw.githubusercontent.com/Kethsar/ytarchive/master/ytarchive.py

bash /usr/src/app/config/auto.sh

python -u /usr/src/app/youtube-dl-server.py
