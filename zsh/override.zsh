# ls Deluxe
alias ls="lsd"

# Fuzzy find a file and open it in nvim
alias f='fd --type f --hidden --exclude .git --exclude target --exclude node_modules | fzf-tmux -p | xargs nvim'
alias fhere='find . -name'

# Remappings for productivity++
alias c="clear"
alias cat='nyan --theme "solarized-dark"'
alias df='duf'
alias du='du -h -c'
alias fzf="fzf --preview 'bat {-1} --color=always'"
alias grep='rg'
alias lll="ls -la"
alias rmi="rip -i"
alias s="ncdu"

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
