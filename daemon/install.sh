#!/bin/sh

# Used to install ASWCP Web Panel.  git is the preferred method (easy to update),
# otherwise wget then finally curl is checked.  If none are installed, exits with error.

GIT_BIN=$(which git | awk '{print $1}')
WGET_BIN=$(which wget | awk '{print $1}')
CURL_BIN=$(which curl | awk '{print $1}')

# Python is absolutely required to make this run (only 2.7.x is supported)
PY_BIN=$(which python2.7 | awk '{print $1}')

# Pip is needed to install Python packages
PIP_BIN=$(which pip | awk '{print $1}')

if [ -z "$PY_BIN" ]; then
    echo "Python 2.7.x is required to run ASWCP Web Panel."
    exit 1
fi

if [ -z "$PIP_BIN" ]; then
    echo "Please install pip to make installing necessary packages easier."
    exit 1
fi

URL="https://github.com/AnzenSolutions/ASWCP-Daemon/archive/master.tar.gz"

FOLDER="ASWCP-Daemon"

# 0 - Not downloaded
# 1 - Downloaded via downloader
# 2 - Cloned
DL=0

if [ -n "$GIT_BIN" ]; then
    git clone git@github.com:AnzenSolutions/ASWCP-Daemon.git
    DL=2
elif [ -n "$WGET_BIN" ]; then
    wget --no-check-certificate "$URL"
    DL=1
elif [ -n "$CURL_BIN" ]; then
    curl "$URL"
    DL=1
fi

if [ $DL -eq 1 ]; then
    tar -xf master.tar.gz
    FOLDER="$FOLDER-master"
    rm -rf master.tar.gz
elif [ $DL -eq 0 ]; then
    echo "Unable to download ASWCP daemon.  Please install either git, wget or curl and make sure `where` command can find it."
    exit 1
fi

echo "ASWCP daemon installed into $FOLDER."
echo "Installing Python requirements via pip..."
cd $FOLDER
pip install -r requirements.txt

exit 0
