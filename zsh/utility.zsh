# Utility Commands
alias listDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'"
alias clearDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# measures zsh shell speed
alias zshprof="/usr/bin/time zsh -i -c exit"

# Jumping around (quick navigation)
alias dot="cd ~/.dotfiles"
alias shop="cd ~/projects/robo/shop"
alias lab="cd ~/projects/labs"
alias wm="cd ~/projects/webmocha/kqed"
alias down="cd ~/Downloads"

alias catPubKey='cat ~/.ssh/id_rsa.pub'
alias getPubKey='cat ~/.ssh/id_rsa.pub | pbcopy'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Show/Hide finder hidden files
alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Brew everything
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

# compression
7zip() {
  tar cf - "$@" | 7za a -si "$@".tar.7z;
}

7unzip() {
  7za x -so "$@" | tar xf -;
}

# Remappings for productivity++
# ---------------
alias c="clear" # lazy
alias cat='nyan --theme "solarized-dark"' # Syntax cat
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder
alias fzf="fzf --preview 'bat {-1} --color=always'" # Syntax pretty preview
alias grep='grep --color=auto' # Color Highlighting
alias lll="exa -lah" # Pretty permissions
alias rm="rm -i" # always confirm before delete
alias s="ncdu" # file explorer that shows size

# Man Command colorizer
man() {
	env \
		LESS_TERMCAP_md=$'\e[1;36m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
			man "$@"
}
