#!/usr/bin/env bash

APPNAME="airsonic"
DOCKER_HUB_URL="airsonic/airsonic:latest"

sudo mkdir -p "$DATADIR"/{music,podcasts,playlists,data}
sudo chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  sudo docker pull "$DOCKER_HUB_URL"
  sudo docker restart "$APPNAME"
else
  sudo docker run -d \
    --name="$APPNAME" \
    --hostname "$APPNAME" \
    --restart=always \
    --privileged \
    -p 4040:4040 \
    -v "$DATADIR/data":/airsonic/data:z \
    -v "$DATADIR/music":/airsonic/music:z \
    -v "$DATADIR/podcasts":/airsonic/podcasts:z \
    -v "$DATADIR/playlists":/airsonic/playlists:z
  "$DOCKER_HUB_URL"
fi
