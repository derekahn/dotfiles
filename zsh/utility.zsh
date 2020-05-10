# Utility Commands
alias c="clear"
alias rm="rm -i"
alias lll="exa -lah"
alias listDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'"
alias clearDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

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

# file explorer that shows size
alias s="ncdu"

# compression
function 7zip() {
  tar cf - "$@" | 7za a -si "$@".tar.7z;
}

function 7unzip() {
  7za x -so "$@" | tar xf -;
}

# override cd to (cd && ls)
function cd {
  builtin cd "$@" && ls
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

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
