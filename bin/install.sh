#!/bin/sh
INSTALLDIR=$PWD

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Checking for Homebrew installation.$(tput sgr 0)"
echo "---------------------------------------------------------"
brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)🏠: Homebrew is installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  brew update
  brew upgrade
  brew doctor
  brew install cask

else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 3)🏠: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  echo "---------------------------------------------------------"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"

packages=(
  "bat"
  "clamav"
  "coreutils"
  "dive"
  "exa"
  "fzf"
  "gh"
  "git"
  "golang"
  "goodwithtech/r/dockertags"
  "goodwithtech/r/dockle"
  "kubectl"
  "lazydocker"
  "moreutils"
  "n"
  "ncdu"
  "neovim"
  "p7zip"
  "python3"
  "reattach-to-user-namespace"
  "ripgrep"
  "speedtest_cli"
  "starship"
  "staticcheck"
  "syntaqx/tap/serve"
  "tig"
  "tmux"
  "tokei"
  "toshimaru/nyan/nyan"
  "wifi-password"
  "yamllint"
  "yarn"
  "zoxide"
  "zsh"
  "zsh-syntax-highlighting"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing casks.$(tput sgr 0)"
echo "---------------------------------------------------------"

applications=(
  "1password"
  "alfred"
  "anki"
  "asciinema"
  "brave-browser"
  "dash"
  "divvy"
  "docker"
  "ExpressVPN"
  "firefox"
  "fork"
  "google-chrome"
  "iterm2"
  "slack"
  "visual-studio-code"
  "vivaldi"
  "wireshark"
)

for i in "${applications[@]}"
do
  brew install --cask $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing system fonts.$(tput sgr 0)"
echo "---------------------------------------------------------"

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing zsh-autosuggestions.$(tput sgr 0)"
echo "---------------------------------------------------------"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing 🐹 Go things.$(tput sgr 0)"
echo "---------------------------------------------------------"

echo "Please enter your github username (ex: derekahn):"
read user

echo "Created your go workspace at: $HOME/go/src/github.com/$user"
mkdir -p $HOME/go/src/github.com/$user

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

echo "Installing 🐹 go tools: godoc, vet"
go get golang.org/x/tools/cmd/godoc
echo "Tools installed. For more information visit https://golang.org/doc/code.html"

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing iterm2 shell integrations.$(tput sgr 0)"
echo "---------------------------------------------------------"

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing Python NeoVim client.$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install --user pynvim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing Neovim plugins and linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Remove current zsh configs.$(tput sgr 0)"
echo "---------------------------------------------------------"

brew link zsh
rm -rf ~/.zsh*

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: system update complete. currently running at 100% power. enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
