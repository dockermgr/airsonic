## 👋 Welcome to airsonic 🚀  

A free, web-based media streamer, providing ubiquitious access to your music  
  
  
## Requires scripts to be installed  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 systemmgr --config && systemmgr install scripts  
```

## Automatic install/update  

```shell
dockermgr update airsonic
```

OR

```shell
mkdir -p "$HOME/.local/share/srv/docker/airsonic/dataDir"
git clone "https://github.com/dockermgr/airsonic" "$HOME/.local/share/CasjaysDev/dockermgr/airsonic"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/airsonic/dataDir/." "$HOME/.local/share/srv/docker/airsonic/dataDir/"
```

## via command line  

```shell
docker pull airsonicadvanced/airsonic-advanced:latest && \
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-airsonic \
--hostname casjaysdev-airsonic \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$HOME/Music":/airsonic/music:z \
-v "$HOME/.local/share/srv/docker/airsonic/dataDir/data":/airsonic/data:z \
-v "$HOME/.local/share/srv/docker/airsonic/dataDir/podcasts":/airsonic/podcasts:z \
-v "$HOME/.local/share/srv/docker/airsonic/dataDir/playlists":/airsonic/playlists:z \
-p 4040:4040 \
airsonicadvanced/airsonic-advanced:latest
```

## via docker-compose  

```yaml
version: "2"
services:
  airsonic:
    image: airsonicadvanced/airsonic-advanced
    container_name: airsonic
    environment:
      - TZ=America/New_York
      - HOSTNAME=casjaysdev-airsonic
    volumes:
      - "$HOME/Music":/airsonic/music:z
      - "$HOME/.local/share/srv/docker/airsonic/dataDir/data":/airsonic/data:z
      - "$HOME/.local/share/srv/docker/airsonic/dataDir/podcasts":/airsonic/podcasts:z
      - "$HOME/.local/share/srv/docker/airsonic/dataDir/playlists":/airsonic/playlists:z
    ports:
      - 4040:4040
    restart: always
```

## Author  

🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ dockermgr: [Github](https://github.com/dockermgr) ⛵  
