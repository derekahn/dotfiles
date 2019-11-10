#!/bin/sh
echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"

INSTALLDIR=$PWD

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
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"

packages=(
  "coreutils"
  "exa"
  "git"
  "fzf"
  "golang"
  "goodwithtech/r/dockl"
  "kubectl"
  "moreutils"
  "n"
  "neovim"
  "ncdu"
  "p7zip"
  "node"
  "python3"
  "reattach-to-user-namespace"
  "speedtest_cli"
  "tig"
  "tmux"
  "wireshark"
  "yamllint"
  "yarn"
  "vim"
  "z"
  "zsh"
  "zsh-syntax-highlighting"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing caskroom/fonts.$(tput sgr 0)"
echo "---------------------------------------------------------"
brew tap caskroom/fonts

applications=(
  "1password"
  "alfred"
  "brave-browser"
  "code-notes"
  "dash"
  "divvy"
  "google-chrome"
  "firefox"
  "fork"
  "font-droidsansmono-nerd-font-mono"
  "iterm2"
  "keybase"
  # "mailspring"
  "slack"
  "wireshark"
  "visual-studio-code"
)


for i in "${applications[@]}"
do
  brew cask install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing Python NeoVim client.$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install neovim
pip3 install --user pynvim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing node neovim package$(tput sgr 0)"
echo "---------------------------------------------------------"

npm install -g neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing spaceship prompt$(tput sgr 0)"
echo "---------------------------------------------------------"

npm install -g spaceship-prompt

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing vim linter (vint)$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install vim-vint

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing bash language server$(tput sgr 0)"
echo "---------------------------------------------------------"

npm i -g bash-language-server

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing system fonts.$(tput sgr 0)"
echo "---------------------------------------------------------"

brew tap caskroom/fonts
brew cask install font-droidsansmono-nerd-font-mono
# brew cask install font-hack-nerd-font

localGit="/usr/local/bin/git"
if ! [[ -f "$localGit" ]]; then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 1)🏠: Invalid git installation. Aborting. Please install git.$(tput sgr 0)"
  echo "---------------------------------------------------------"
  exit 1
fi

# Create backup folder if it doesn't exist
mkdir -p ~/.local/share/nvim/backup

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing oh-my-zsh.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)🏠: oh-my-zsh already installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing zsh-autosuggestions.$(tput sgr 0)"
echo "---------------------------------------------------------"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing iterm2 shell integrations.$(tput sgr 0)"
echo "---------------------------------------------------------"
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing Neovim plugins and linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"

source ./backup.sh
source ./link.sh
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing tmux plugin manager.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
