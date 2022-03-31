#!/bin/bash

#remove # in below line, change URL channel and location/name log file (if need).
#Add random sleep between 2 channels to make live-dl not run at SAME TIME.
#Yes, you can add multi channel.

#nohup /bin/bash /usr/src/app/live-dl -ac https://www.youtube.com/channel/UCP0BspO_AMEe3aQqqpo89Dg &>/youtube-dl/live-dl-moona.$(date +%d%b%y-%H%M%S).log &
sleep 30

#nohup /bin/bash /usr/src/app/live-dl -li 900 https://www.youtube.com/channel/UCP0BspO_AMEe3aQqqpo89Dg/community &>/tmp/live-dl-moona-membership.$(date +%d%b%y-%H%M%S).log &
sleep 10

#nohup /bin/bash /usr/src/app/live-dl https://www.youtube.com/channel/UCOyYb1c43VlX9rc_lT6NKQw &>/youtube-dl/live-dl-risu.$(date +%d%b%y-%H%M%S).log &
sleep 20

#nohup /bin/bash /usr/src/app/live-dl -kf -rt https://www.youtube.com/channel/UC1DCedRgGHBdm81E1llLhOQ &>/tmp/live-dl-pekora.$(date +%d%b%y-%H%M%S).log &
sleep 15

#nohup /bin/bash /usr/src/app/live-dl -kf --filter Unarchive|Karaoke|Sing -ao  https://www.youtube.com/channel/UCP0BspO_AMEe3aQqqpo89Dg &>/youtube-dl/live-dl-moona-audio-only.$(date +%d%b%y-%H%M%S).log &

sleep 15

#nohup /bin/bash /usr/src/app/live-dl -ac https://www.twitch.tv/*** &>/youtube-dl/live-dl-***.$(date +%d%b%y-%H%M%S).log &
