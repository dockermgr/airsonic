#!/usr/bin/env bash

APPNAME="airsonic"
DATADIR="/srv/docker/$APPNAME"

mkdir -p "$DATADIR"/{music,podcasts,playlists,data} && chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
docker pull airsonic/airsonic:latest && docker restart $APPNAME
else

docker run -d \
--name="$APPNAME" \
--hostname "$APPNAME" \
--restart=always \
--privileged \
-p 4040:4040 \
-v $DATADIR/data:/airsonic/data:z \
-v $DATADIR/music:/airsonic/music:z \
-v $DATADIR/podcasts:/airsonic/podcasts:z \
-v $DATADIR/playlists:/airsonic/playlists:z \
airsonic/airsonic:latest
