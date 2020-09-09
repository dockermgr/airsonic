#!/usr/bin/env bash

mkdir -p /srv/docker/airsonic/{music,podcasts,playlists,data} && chmod -Rf 777 /srv/docker/airsonic

docker run -d \
--name=airsonic \
--hostname airsonic \
--restart=always \
--privileged \
-p 4040:4040 \
-v /srv/docker/airsonic/data:/airsonic/data:z \
-v /srv/docker/airsonic/music:/airsonic/music:z \
-v /srv/docker/airsonic/podcasts:/airsonic/podcasts:z \
-v /srv/docker/airsonic/playlists:/airsonic/playlists:z \
airsonic/airsonic:latest
