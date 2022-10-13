#!/usr/bin/env bash
INSTALLDIR=$PWD

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Linking symlink files.$(tput sgr 0)"
echo "---------------------------------------------------------"

linkables=$( find -H "$INSTALLDIR" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
  target="$HOME/.$( basename $file '.symlink' )"
  if [ -e $target ]; then
    echo "---------------------------------------------------------"
    echo "$(tput setaf 3)🏠: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
    echo "---------------------------------------------------------"
  else
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)🏠: Creating symlink for $file.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    ln -s $file $target
  fi
done

if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing config files.$(tput sgr 0)"
echo "---------------------------------------------------------"

for config in $INSTALLDIR/config/*; do
  target=$HOME/.config/$( basename $config )
  if [ -e $target ]; then
    echo "---------------------------------------------------------"
    echo "$(tput setaf 3)🏠: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
    echo "---------------------------------------------------------"
  else
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)🏠: Creating symlink for ${config}.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    ln -s $config $target
  fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Symlinking Lazygit.$(tput sgr 0)"
echo "---------------------------------------------------------"
ln -s $HOME/Library/Application\ Support/lazygit/config.yml $INSTALLDIR/config/lazygit/config.yml

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Sourcing ~/.tmux.conf.$(tput sgr 0)"
echo "---------------------------------------------------------"

tmux source ~/.tmux.conf
