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

network_tools=(
  "croc"
  "httpie"
  "syntaqx/tap/serve"
  "ycd/tap/dstp"
)

packages=(
  # applications
  "boop"
  "iina"

  ################
  # Tools
  ################
  # file
  "bat"
  "lsd"
  "ncdu"
  "p7zip"
  "tokei"
  "toshimaru/nyan/nyan"

  # json
  "dasel"
  "fx"

  # git
  "git-delta"
  "lazygit"

  # security
  "aquasecurity/trivy/trivy"
  "clamav"

  # search
  "fd"
  "fzf"
  "ranger"
  "rga"
  "ripgrep"

  ################
  # LANGUAGES
  ################
  # go
  "dlv"
  "golang"
  "gomodifytags"
  "gotests"
  "staticcheck"

  # node.js
  "volta"
  "prettier"

  # python
  "python3"

  # rust
  "michaeleisel/zld/zld"

  # linters
  "jsonlint"
  "kube-score/tap/kube-score"
  "proselint"
  "shfmt"
  "stylua"
  "write-good"
  "yamllint"

  ################
  # Terminal
  ################
  # editor
  "neovim"
  "tmux"
  "reattach-to-user-namespace"

  # shell
  "starship"
  "zoxide"
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
  "--no-quarantine syntax-highlight"
  "1password"
  "alfred"
  "anki"
  "asciinema"
  "db-browser-for-sqlite"
  "firefox-developer-edition"
  "fork"
  "google-chrome"
  "iterm2"
  "nordvpn"
  "qlmarkdown"
  "rectangle"
  "slack"
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
echo "$(tput setaf 2)🏠: Installing 🦀 rust things.$(tput sgr 0)"
echo "---------------------------------------------------------"

curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh

rustup component add rust-src
rustup component add rustfmt
rustup component add rust-analyzer

# this installs to a different path so may require, see https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
ln /home/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer /home/.cargo/bin
ln $HOME/.rustup/toolchains/stable-x86_64-apple-darwin/bin/rust-analyzer $HOME/.cargo/bin

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Manually installing zsh-autosuggestions.$(tput sgr 0)"
echo "---------------------------------------------------------"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing 🌙 LunarVim.$(tput sgr 0)"
echo "---------------------------------------------------------"

export LV_BRANCH='release-1.2/neovim-0.8'
curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: system update complete. currently running at 100% power. enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
