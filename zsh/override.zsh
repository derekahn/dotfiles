# ls Deluxe
alias ls="lsd"

# Fuzzy find a file and open it in lvim
alias f='fd --type f --hidden --exclude .git --exclude target --exclude node_modules | fzf-tmux -p | xargs lvim'
alias fhere='find . -name '

# Remappings for productivity++
# ---------------
alias c="clear"                                     # lazy
alias cat='nyan --theme "solarized-dark"'           # syntax cat
alias df='duf'                                      # disk free, in Gigabytes, not bytes
alias du='du -h -c'                                 # calculate disk usage for a folder
alias fzf="fzf --preview 'bat {-1} --color=always'" # syntax pretty preview
alias grep='grep --color=auto'                      # color Highlighting
alias lll="ls -la"                                  # pretty permissions
alias rm="rip -i"                                   # always confirm before delete
alias s="ncdu"                                      # file explorer that shows size
alias grep="rg"                                     # a better grep

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
