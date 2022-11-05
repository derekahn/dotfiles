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
    ln -fs $file $target
  fi
done

if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Delete existing configs.$(tput sgr 0)"
echo "---------------------------------------------------------"

for dir in "lazygit", "lvim", "nvim", "starship"; do
  rm -rf dir
done

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
    ln -fs $config $target
  fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Symlinking Lazygit.$(tput sgr 0)"
echo "---------------------------------------------------------"
rm -rf $INSTALLDIR/config/lazygit/config.yml
ln -fs $HOME/Library/Application\ Support/lazygit/config.yml $INSTALLDIR/config/lazygit/config.yml

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Set global git config username$(tput sgr 0)"
echo "---------------------------------------------------------"

echo "Please enter your global git username (ex: derekahn):"
read user

echo "Created your global git config username at: $HOME/.config/git/config"
git git config --global user.name $user

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Set global git config email$(tput sgr 0)"
echo "---------------------------------------------------------"

echo "Please enter your global git email (ex: email@example.com):"
read $email

echo "Created your global git config email at: $HOME/.config/git/config"
git config --global user.email "$email"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Sourcing ~/.tmux.conf.$(tput sgr 0)"
echo "---------------------------------------------------------"

tmux source ~/.tmux.conf
