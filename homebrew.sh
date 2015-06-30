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
TOOLS="openssl tmux youtube-dl ctags irssi macvim wget ack lftp "
VERSION_CTRL="git git-extrax subversion"
LIBS="readline"
DBS="mongodb postgresql redis pgcli berkeley-db sqlite"
OTHER="chromedriver bash cloc ctagsi cabextract colordiff"
SEC="reaver aircrack-ng binwalk john hydra hping netcat6 tcpdump tcpflow tcping tcpreplay tcptraceroute ssldump sslscan sslyze skipfish sqlitebrowser sqlmap zmap nmap truecrack"
FORENSIC="autopsy chkrootkit volatilityi libewf sleuthkit recoverjpeg"
SHELLS="bash bash-completion"
COLLECTION="$MEDIA $TOOLS $VERSION_CTRL $LIBS $DBS $OTHER $SEC $FORENSIC"
BREW=$(which brew)

USER_INPUT=$1

# Fancy colours 
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
WHITE='\033[1;37m'
NOCOL='\033[0m'


# In case you are drunk or similar
fail_save()
{
# Check if ROOT or the one and only OS

if [[ "$EUID" == 0 ]] || [[ $(uname) != "Darwin" ]]; then
    echo -e "${RED}This script must NOT be run as root or other OS than OS X ${NOCOL}"
    exit 1;
fi
}

# Homebrew
# Noob checks if brew is already installed, if not install and do settings stuff

brew_install()
{
if [[ ! -z "$BREW" ]]; then
    # i needed to do some debugging 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
    export PATH="/usr/local/bin:$PATH"  
    printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile  
fi
}


# Enforce openssl linkage and clean up downloads at the end
brew_clean_and_force()
{

brew link openssl --force
brew cleanup
}

brew_install

# install all the things

case "$USER_INPUT" in
    -l)
        FILEPATH=$2
        
        if [[ ! -f $FILEPATH ]]; then 
            echo -e "${LIGHT_RED} could not find the file exiting... ${NOCOL}"
            exit 1;
        fi
        COLLECTION=$(cat $FILEPATH | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g')
        brew install $COLLECTION
        brew_clean_and_force
        ;;
    -a)
        brew install $COLLECTION
        brew_clean_and_force
        ;;
    *)
        echo -e "${LIGHT_RED} Please start script with $0 -a for automatic install of typical tools ... ${NOCOL}"
        echo -e "${LIGHT_RED} or provide a list from brew --list with $0 -l /path/to/list to install your set of brews ${NOCOL}" 
        exit 1
        ;;
esac


