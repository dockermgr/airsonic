#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
APPNAME="airsonic"
VERSION="202107311147-git"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"
SRC_DIR="${BASH_SOURCE%/*}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#set opts

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202107311147-git
# @Author        : casjay
# @Contact       : casjay
# @License       : WTFPL
# @ReadME        : dockermgr --help
# @Copyright     : Copyright: (c) 2021 casjay, casjay
# @Created       : Saturday, Jul 31, 2021 11:47 EDT
# @File          : airsonic
# @Description   : airsonic container installer
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Import functions
CASJAYSDEVDIR="${CASJAYSDEVDIR:-/usr/local/share/CasjaysDev/scripts}"
SCRIPTSFUNCTDIR="${CASJAYSDEVDIR:-/usr/local/share/CasjaysDev/scripts}/functions"
SCRIPTSFUNCTFILE="${SCRIPTSAPPFUNCTFILE:-testing.bash}"
SCRIPTSFUNCTURL="${SCRIPTSAPPFUNCTURL:-https://github.com/dfmgr/installer/raw/$GIT_DEFAULT_BRANCH/functions}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [ -f "$PWD/$SCRIPTSFUNCTFILE" ]; then
  . "$PWD/$SCRIPTSFUNCTFILE"
elif [ -f "$SCRIPTSFUNCTDIR/$SCRIPTSFUNCTFILE" ]; then
  . "$SCRIPTSFUNCTDIR/$SCRIPTSFUNCTFILE"
else
  echo "Can not load the functions file: $SCRIPTSFUNCTDIR/$SCRIPTSFUNCTFILE" 1>&2
  exit 1
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# user system devenv dfmgr dockermgr fontmgr iconmgr pkmgr systemmgr thememgr wallpapermgr
dockermgr_install
__options "$@"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Begin installer
APPNAME="airsonic"
DOCKER_HUB_URL="airsonic/airsonic:latest"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
APPDIR="/usr/local/share/docker/$APPNAME"
INSTDIR="/usr/local/share/CasjaysDev/$SCRIPTS_PREFIX/$APPNAME"
DATADIR="/srv/docker/$APPNAME"
REPORAW="$REPO/raw/$REPO_BRANCH"
APPVERSION="$(__appversion "$REPORAW/version.txt")"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sudo mkdir -p "$DATADIR"/{music,podcasts,playlists,data}
sudo chmod -Rf 777 "$DATADIR"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
    -v "$DATADIR/playlists":/airsonic/playlists:z \
    "$DOCKER_HUB_URL" &>/dev/null
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  printf_green "Successfully setup airsonic"
else
  printf_return "Could not setup airsonic"
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# End script
exit $?
