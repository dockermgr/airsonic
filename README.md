## 👋 Welcome to airsonic 🚀  

A free, web-based media streamer, providing ubiquitious access to your music
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update airsonic
```
  
## Install and run container
  
```shell
mkdir -p "$HOME/.local/share/srv/docker/airsonic/rootfs"
git clone "https://github.com/dockermgr/airsonic" "$HOME/.local/share/CasjaysDev/dockermgr/airsonic"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/airsonic/rootfs/." "$HOME/.local/share/srv/docker/airsonic/rootfs/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-airsonic \
--hostname airsonic \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$HOME/Music":"/airsonic/music/$USER":z \
-v "$HOME/.local/share/srv/docker/casjaysdevdocker-airsonic/rootfs/data":/data:z \
-v "$HOME/.local/share/srv/docker/casjaysdevdocker-airsonic/rootfs/config":/config:z \
-v "$HOME/.local/share/srv/docker/casjaysdevdocker-airsonic/rootfs/data/podcasts":/airsonic/podcasts:z \
-v "$HOME/.local/share/srv/docker/casjaysdevdocker-airsonic/rootfs/data/playlists":/airsonic/playlists:z \
-p 0.0.0.0:4040:4040 \
casjaysdevdocker/airsonic:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/airsonic
    container_name: casjaysdevdocker-airsonic
    environment:
      - TZ=America/New_York
      - HOSTNAME=airsonic
    volumes:
      - "$HOME/.local/share/srv/docker/casjaysdevdocker-airsonic/rootfs/data":/data:z
      - "$HOME/.local/share/srv/docker/casjaysdevdocker-airsonic/rootfs/config":/config:z
      - "$HOME/.local/share/srv/docker/casjaysdevdocker-airsonic/rootfs/data/podcasts":/airsonic/podcasts:z
      - "$HOME/.local/share/srv/docker/casjaysdevdocker-airsonic/rootfs/data/playlists":/airsonic/playlists:z
    ports:
      -0.0.0.0:4040:4040
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/airsonic
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/airsonic" "$HOME/Projects/github/casjaysdevdocker/airsonic"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/airsonic"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
