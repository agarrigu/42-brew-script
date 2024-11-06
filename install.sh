#!/bin/bash

HBDIR="$HOME/homebrew"
SHELLRC=".zshrc"
SHELL="zsh"

if [ $(id -u) -e 0 ]; then
	echo "Don't run as root"
fi

mkdir $HBDIR

curl -L https://github.com/Homebrew/brew/tarball/master | tar -xz --strip 1 -C $HBDIR

eval "$($HBDIR/bin/brew shellenv)"

echo 'eval "$('$HBDIR'/bin/brew shellenv)"' >> $SHELLRC

brew update --force --quiet

chmod -R go-w "$(brew --prefix)/share/$SHELL"
