#!/bin/bash

# DESCRIPTION
# Installs Homebrew software.

# EXECUTION
# Homebrew
if ! command -v brew > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
  printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

# Readline
brew install readline

# OpenSSL
brew install openssl
brew link openssl --force

# tmux
brew install tmux

# Youtube Downloader
brew install youtube-dl

# Git
brew install git git-extras

# CTags
brew install ctags

# Irssi
brew install irssi

# MacVim
brew install macvim

# MPlayer
brew install mplayer

# Wget
brew install wget

# ImageMagick
brew install imagemagick

# FLAC
brew install flac

# FFmpeg
brew install ffmpeg

# Redis
brew install redis

# Chromedriver
brew install chromedriver

# Ack
brew install ack

# MongoDB
brew install mongodb

# PostgreSQL
brew install postgresql

# pgcli
brew install pgcli

# cloc
brew install cloc

# Clean up downloads at the end
brew cleanup
