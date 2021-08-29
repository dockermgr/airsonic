# Welcome to dockermgr airsonic installer 👋
  
## A free, web-based media streamer, providing ubiquitious access to your music  
  
### Requires scripts to be installed

```shell
 sudo bash -c "$(curl -LSs <https://github.com/dockermgr/installer/raw/main/install.sh>)"
 dockermgr --config && dockermgr install scripts  
```

#### Automatic install/update  

```shell
dockermgr install airsonic
```


#### Manual install

```shell
git clone https://github.com/dockermgr/airsonic "$HOME/.local/share/CasjaysDev/dockermgr/airsonic"
bash -c "$HOME/.local/share/CasjaysDev/dockermgr/airsonic/install.sh"
```
  
#### Just run

mkdir -p "$HOME/.local/share/srv/docker/airsonic/"

git clone <https://github.com/dockermgr/airsonic> "$HOME/.local/share/CasjaysDev/dockermgr/airsonic"

cp -Rf "$HOME/.local/share/srv/docker/airsonic/system/*" "$HOME/.local/share/srv/docker/airsonic/"

sudo docker run -d \
--name="airsonic" \
--hostname "airsonic" \
--restart=unless-stopped \
--privileged \
-e TZ="${TZ:-${TIMEZONE:-America/New_York}}" \
-v "$DATADIR/data":/airsonic/data:z \
-v "$DATADIR/music":/airsonic/music:z \
-v "$DATADIR/podcasts":/airsonic/podcasts:z \
-v "$DATADIR/playlists":/airsonic/playlists:z \
-p PORT:INT_PORT \
linuxserver/airsonic 1>/dev/null
