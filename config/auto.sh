#!/bin/bash

#remove # in below line, change URL channel and location/name log file (if need). Yes, you can add multi channel.
#nohup /bin/bash /usr/src/app/live-dl -ac https://www.youtube.com/channel/UCP0BspO_AMEe3aQqqpo89Dg &>/tmp/live-dl-moona.$(date +%d%b%y-%H%M%S).log &

#nohup /bin/bash /usr/src/app/live-dl -li 900 https://www.youtube.com/channel/UCP0BspO_AMEe3aQqqpo89Dg/community &>/tmp/live-dl-moona-membership.$(date +%d%b%y-%H%M%S).log &

#nohup /bin/bash /usr/src/app/live-dl https://www.youtube.com/channel/UCOyYb1c43VlX9rc_lT6NKQw &>/tmp/live-dl-risu.$(date +%d%b%y-%H%M%S).log &

#nohup /bin/bash /usr/src/app/live-dl -kf -rt https://www.youtube.com/channel/UC1DCedRgGHBdm81E1llLhOQ &>/tmp/live-dl-pekora.$(date +%d%b%y-%H%M%S).log &
