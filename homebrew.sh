#!/bin/bash

# DESCRIPTION
# Installs Homebrew software.

# Be safe out there 
shopt -s extglob extquote
# we aint allow unset vars and exit if error occurs 
#set -o nounset
#set -o errexit

# Vars, binaries, path and foo

# Collection of brews to install
MEDIA="mpv flac ffmpeg faac imagemagick"
TOOLS="openssl tmux youtube-dl git git-extras ctags irssi macvim wget ack "
VERSION_CTRL="git git-extrax "
LIBS="readline"
DBS="mongodb postgresql redis pgcli"
OTHER="chromedriver bash cloc ctags"
COLLECTION="$MEDIA $TOOLS $VERSION_CTRL $LIBS $DBS $OTHER"


# Fancy colours 
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
WHITE='\033[1;37m'
NOCOL='\033[0m'


# Check if ROOT
if [[ "$EUID" == 0 ]]; then
    echo -e "${RED}This script must NOT be run as root ${NOCOL}"
    exit 1;
fi


# EXECUTION
# Homebrew

BREW=$(which brew)

if [[ ! -z "$BREW" ]]; then
    # i needed to do some debugging 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
     export PATH="/usr/local/bin:$PATH" 
     printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile 
fi


echo brew install $COLLECTION
# brew link openssl --force

#
# case what to install
#

# Clean up downloads at the end
echo brew cleanup
