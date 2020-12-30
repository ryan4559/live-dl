#!/usr/bin/env python

import sys
import time
import logging
import json
from datetime import datetime, timedelta, timezone

import pytchat
from pytchat.processors.dummy_processor import DummyProcessor
from pytchat.processors.html_archiver import HTMLArchiver

def fetch(video_id, output_dir, fallback_poll_interval=5):
    stream = pytchat.create(video_id=video_id, processor=DummyProcessor())
    total_len = 0
    logging.basicConfig(filename=output_dir + '_chat.log',level=logging.INFO, format='%(asctime)s %(pathname)s:%(lineno)s:\t%(msg)s')

    with open(output_dir + '_chat.json', 'a') as json_out:
        logging.info(f'appending to {json_out.name}')

        while stream.is_alive():
            poll_interval = fallback_poll_interval

            chats = stream.get()
            if len(chats) != 1:
                time.sleep(poll_interval)
                continue

            chat = chats[0]
            if not chat:
                time.sleep(poll_interval)
                continue

            poll_interval = chat.get('timeout', poll_interval)
            chatdata = chat.get('chatdata') or []
            for item in chatdata:
                json_out.write(json.dumps(item, ensure_ascii=False, sort_keys=True, separators=(',', ':')) + '\n')

            logging.info(f'len: {total_len} + {len(chatdata)}, sleep: {poll_interval}')
            total_len += len(chatdata)

            time.sleep(poll_interval)

def render(video_id, output_dir, start_us_utc):
    start = datetime.fromtimestamp(start_us_utc / 1e6, timezone.utc)
    ar = HTMLArchiver(output_dir + '_chat.html')
    logging.basicConfig(filename=output_dir + '_chat.log',level=logging.INFO, format='%(asctime)s %(pathname)s:%(lineno)s:\t%(msg)s')

    with open(output_dir + '_chat.json') as json_in:
        logging.info(f'reading from {json_in.name}')
        batch = []

        for line in json_in:
            chat = json.loads(line)
            if 'addChatItemAction' not in chat:
                continue

            # write elapsed time
            for k, v in chat['addChatItemAction']['item'].items():
                if not v.get('timestampUsec'):
                    continue
                timestamp_us = float(v['timestampUsec'])
                timestamp = datetime.fromtimestamp(timestamp_us / 1e6, timezone.utc)
                if timestamp >= start:
                    elapsed = str(timestamp - start)
                else:
                    elapsed = '-' + str(start - timestamp)
                chat['addChatItemAction']['item'][k]['timestampText'] = {'simpleText': elapsed}

            batch.append(chat)
            if (len(batch)+1) % 32 == 0:
                ar.process([{'chatdata': batch}])
                batch.clear()

        if len(batch) > 0:
            ar.process([{'chatdata': batch}])
    ar.finalize()

if __name__ == '__main__':
    verb = sys.argv[1]
    if verb == 'fetch':
        video_id = sys.argv[2]
        output_dir = str(sys.argv[3])
        fetch(video_id, output_dir)
    elif verb == 'render':
        video_id = sys.argv[2]
        output_dir = str(sys.argv[3])
        start_us_utc = float(sys.argv[4])
        render(video_id, output_dir, start_us_utc)
    else:
        sys.exit(1)
