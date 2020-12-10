#!/bin/bash
bash /usr/src/app/config/auto.sh

python -u /usr/src/app/youtube-dl-server.py

while true; do
  sleep 1000
done