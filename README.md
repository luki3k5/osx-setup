OS X Setup 
=========


## Overview

This script is designed for an easy setup of OS X brews after re-install or clean install. It is designed as fire and forget script. 

What it does
---------------------------
This script takes a set of brew packets and installs it via brew install.
It takes a set of packets definded in categories and installs them, also it supports
a list of packets created by brew list >> list_of_brews. 

What it does not
---------------------------
Right now it does not install taps. 
It does not checkout dotfiles, also it does not install binaries/dmg files.

Collection
---------------------------
The collection of brew are specified in the following variables:

*MEDIA* 
*TOOLS*
*VERSION_CTRL*
*LIBS*
*DBS* 
*OTHER*

so the use can adjust packages to his needs. 

General usage
---------------------------
The script is executed in a terminal `./homebrew.sh -a` for installation of a given
set of brew defined in the Collection variable.
Startet with `./homebrew -l /path/to/lists` the scripts installs brews from the list.

