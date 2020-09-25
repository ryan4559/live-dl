#!/bin/bash
find /usr/src/app/Auto/ -maxdepth 1 -type f -exec bash {} \;

while true; do
  sleep 1000
done