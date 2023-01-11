# Utility Commands
alias listDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'"
alias clearDownloadLog="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# measures zsh shell speed
alias zshprof="/usr/bin/time zsh -i -c exit"
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

# Fuzzy find a file and open it in lvim
alias f='fd --type f --hidden --exclude .git --exclude target --exclude node_modules | fzf-tmux -p | xargs lvim'

# ls Deluxe
alias ls="lsd"

# compression
function 7zip() {
	tar cf - "$@" | 7za a -si "$@".tar.7z
}

function 7unzip() {
	7za x -so "$@" | tar xf -
}

# Remappings for productivity++
# ---------------
alias c="clear"                                     # lazy
alias cat='nyan --theme "solarized-dark"'           # Syntax cat
alias df='df -h'                                    # disk free, in Gigabytes, not bytes
alias du='du -h -c'                                 # calculate disk usage for a folder
alias fzf="fzf --preview 'bat {-1} --color=always'" # Syntax pretty preview
alias grep='grep --color=auto'                      # Color Highlighting
alias lll="ls -la"                                  # Pretty permissions
alias rm="rm -i"                                    # always confirm before delete
alias s="ncdu"                                      # file explorer that shows size

# Man Command colorizer
function man() {
	env \
		LESS_TERMCAP_md=$'\e[1;36m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
		man "$@"
}

# ls dir color
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias fhere='find . -name '

function mcd() {
	mkdir -pv $1
	cd $1
}

alias mp3='youtube-dl -x --audio-format mp3'

alias python=python3

alias trivyy='trivy fs --skip-dirs node_modules --skip-dirs src/node_modules --security-checks vuln,config .'

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
