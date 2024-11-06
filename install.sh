#!/bin/bash

HBDIR="$HOME/homebrew"
SHELLRC="$HOME/.bashrc"

if [ $(id -u) -eq 0 ]; then
	echo "Don't run as root"
 	exit 1
fi

if [ -d $HBDIR ]; then
	echo "$HBDIR already exists, please remove and run again"
	exit 1
fi

mkdir $HBDIR

if ! command -v curl 2>&1 >/dev/null; then
	echo "curl is needed for installation"
	exit 1
fi

if ! command -v tar 2>&1 >/dev/null; then
	echo "tar is needed for installation"
	exit 1
fi

curl -L https://github.com/Homebrew/brew/tarball/master | tar -xz --strip 1 -C $HBDIR

eval "$($HBDIR/bin/brew shellenv)"

brew update --force --quiet

#QOL stuff
chmod -R go-w "$(brew --prefix)/share/zsh"
echo 'eval "$('$HBDIR'/bin/brew shellenv)"' >> $SHELLRC
