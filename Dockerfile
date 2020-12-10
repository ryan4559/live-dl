FROM python:alpine

RUN apk add --no-cache aria2 \
	&& adduser -D aria2 \
	&& mkdir -p /etc/aria2 \
	&& mkdir -p /aria2down \
	&& rm -rf /var/lib/apk/lists/*
	
RUN apk add --no-cache \
  ffmpeg \
  tzdata \
  jq  \
  exiv2  \
  bash  \
  curl  \
  perl  \
  coreutils

RUN pip3 install yq

RUN pip install bottle youtube-dl

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app
RUN chmod a+x /usr/src/app/live-dl \
	&& chmod +x /usr/src/app/autoscript.sh \
	&& chmod +x /usr/src/app/config/

EXPOSE 8080

VOLUME ["/youtube-dl"]

CMD [ "/usr/src/app/autoscript.sh" ]
