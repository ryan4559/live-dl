# [`youtube-dl-server`](https://github.com/manbearwiz/youtube-dl-server)

Download files location (default): `/youtube-dl/`

Web gui : `http://{{host}}:8080/youtube-dl`

# [`live-dl`](https://github.com/sparanoid/live-dl)

Download files location (default): `/youtube-dl/VTuber Recordings`

# Volume Map for Sysnology NAS Docker

Download [config.example.yml](https://github.com/herowinb/live-dl/blob/master/config.example.yml) and rename to config.yml.

<img src="https://i.imgur.com/MTATZ3K.png">

Download [example.sh](https://github.com/herowinb/live-dl/blob/master/Auto/example.sh), edit, rename, put in to a folder Audo. Now you can run live-dl to monitor and download live stream from your <strike>Waifu</strike> Vtuber.

<img src="https://i.imgur.com/CuvMdPr.png">

Use live-dl

<img src="https://i.imgur.com/5uFLJtr.png">

You can run this script in background (manualy):

```shell
# Start process
nohup bash live-dl https://www.youtube.com/channel/UC1opHUrw8rvnsadT-iGp7Cg &>/tmp/live-dl-minatoaqua.log &

# View processes
ps aux | grep live-dl
501 94552   964   0  9:38PM ttys009    0:00.06 bash live-dl https://www.youtube.com/channel/UC1opHUrw8rvnsadT-iGp7Cg
501 94765   964   0  9:39PM ttys009    0:00.00 grep live-dl

# Stop process
kill 94552
```
# Docker Desktop for Windows Stable (Docker Desktop Community 2.4.0.0)

Get [Docker install pack](https://www.docker.com/products/docker-desktop) and [WSL2 update](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi).
After install WSL2 and Docker, open CMD and type `docker pull herowinb/live-dl:latest` to get latest version from Docker Hub.

Create 1 folder for download files. Download and unzip [source code](https://github.com/herowinb/live-dl/archive/master.zip) rename (or edit your config) `config.example.yml` to `config.yml`, edit `example.sh` in `Auto` folder to monitor and download live stream.

Open Docker Dashboard, check downloaded images in LOCAL, click Run and add some Optional Settings

<img src="https://i.imgur.com/lj0WQw7.png">

<img src="https://i.imgur.com/lbFtmN3.png">

CLI
<img src="https://i.imgur.com/uVssi9f.png">
