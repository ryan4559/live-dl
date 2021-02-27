#!/bin/bash

pip install --no-cache-dir --upgrade --quiet youtube-dl pytchat

bash /usr/src/app/config/auto.sh

python -u /usr/src/app/youtube-dl-server.py
