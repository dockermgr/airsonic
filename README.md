## 👋 Welcome to airsonic 🚀  

Airsonic-Advanced is a free, web-based media streamer  
  
  
### Requires scripts to be installed  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 systemmgr --config && systemmgr install scripts  
```

### Automatic install/update  

```shell
dockermgr update airsonic
```

### via command line  

```shell
mkdir -p "$HOME/.local/share/srv/docker/airsonic/dataDir"
git clone "https://github.com/dockermgr/airsonic" "$HOME/.local/share/CasjaysDev/dockermgr/airsonic"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/airsonic/dataDir/." "$HOME/.local/share/srv/docker/airsonic/dataDir/"
```

```shell
docker pull airsonicadvanced/airsonic-advanced:latest && \
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-airsonic \
--hostname casjaysdev-airsonic \
-e TZ=${TIMEZONE:-America/New_York} \
-v $HOME/Music:/var/music/$USER:z \
-v $HOME/.local/share/srv/docker/airsonic/dataDir/data:/data:z \
-v $HOME/.local/share/srv/docker/airsonic/dataDir/config:/config:z \
-v $HOME/.local/share/srv/docker/airsonic/dataDir/data/music:/var/music:z \
-v $HOME/.local/share/srv/docker/airsonic/dataDir/data/podcasts:/var/podcasts \
-v $HOME/.local/share/srv/docker/airsonic/dataDir/data/playlists:/var/playlists:z \
-p 4000:4000 \
airsonicadvanced/airsonic-advanced:latest
```

### via docker-compose  

```yaml
version: "2"
services:
  airsonic:
    image: airsonicadvanced/airsonic-advanced:latest
    container_name: airsonic
    environment:
      - TZ=America/New_York
      - HOSTNAME=casjaysdev-airsonic
    volumes:
      - $HOME/Music:/var/music/$USER:z
      - $HOME/.local/share/srv/docker/airsonic/dataDir/data:/data:z
      - $HOME/.local/share/srv/docker/airsonic/dataDir/config:/config:z
      - $HOME/.local/share/srv/docker/airsonic/dataDir/data/music:/var/music:z
      - $HOME/.local/share/srv/docker/airsonic/dataDir/data/podcasts:/var/podcasts
      - $HOME/.local/share/srv/docker/airsonic/dataDir/data/playlists:/var/playlists:z
    ports:
      - 4000:4000
    restart: always
```

## Author  

🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ dockermgr: [Github](https://github.com/dockermgr) ⛵  
