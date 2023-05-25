# Utility Commands
alias listDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'"
alias clearDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# measures zsh shell speed
alias zshprof="/usr/bin/time zsh -i -c exit"
alias catPubKey="cat ~/.ssh/id_rsa.pub"
alias getPubKey="cat ~/.ssh/id_rsa.pub | pbcopy"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Show/Hide finder hidden files
alias showHidden="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hideHidden="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"

# Brew everything
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

# Crypto Greed Index
alias cgi="http 'https://api.alternative.me/fng/?limit=3' | jq '.data[0].value'"

alias killFinder="defaults write com.apple.Finder QuitMenuItem -bool TRUE; killall Finder"

# compression
function 7zip() {
	tar cf - "$@" | 7za a -si "$@".tar.7z
}

function 7unzip() {
	7za x -so "$@" | tar xf -
}

function mcd() {
	mkdir -pv $1
	cd $1
}

alias mp3="youtube-dl -x --audio-format mp3"

alias trivyy='trivy fs --skip-dirs node_modules --skip-dirs src/node_modules --scanners vuln,config .'

function rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
			--phony -q "$1" \
			--bind "change:reload:$RG_PREFIX {q}" \
			--preview-window="70%:wrap"
	)" &&
		echo "opening $file" &&
		xdg-open "$file"
}

function weather() {
	# Name the parameter for convenience
	local is_fancy="$2"

	if [ "$is_fancy" = "true" ]; then
		curl "wttr.in/$1?format=v2"
	else
		curl "wttr.in/$1"
	fi
}

# Pomodoro (Requires https://github.com/caarlos0/timer)
alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
  -title 'Work Timer is up! Take a Break :blush:'\
  -appIcon '~/Pictures/pumpkin.png'\
  -sound Crystal"

alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
  -title 'Break is over! Get back to work :grimacing:'\
  -appIcon '~/Pictures/pumpkin.png'\
  -sound Crystal"
