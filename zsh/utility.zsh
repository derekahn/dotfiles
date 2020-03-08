# Utility Commands
alias c="clear"
alias rm="rm -i"
alias cb="pwd | pbcopy"
alias lll="exa -lah"
alias listDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'"
alias clearDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Clear terminal files
alias terminal-clean='sudo rm -f /private/var/log/asl/*.asl'

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

alias catPubKey='cat ~/.ssh/id_rsa.pub'
alias getPubKey='cat ~/.ssh/id_rsa.pub | pbcopy'

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Show/Hide finder hidden files
alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Open Chrome browser from terminal
alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"

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

# find shorthand
function f() {
  find . -name "$1"
}

# Start an HTTP server from a directory, optionally specifying the port
function startFileServer() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  http-server -p 8000
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

# get gzipped size
function gzsize() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# unzip tar.gz
function untargz() {
  echo "orig size    (bytes): "
  gunzip -c "$1" | tar xopf -
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
