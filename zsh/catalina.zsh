# Fix zsh key bindings
# ---------------
bindkey -e

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Catalina zsh navigation
# ---------------
setopt auto_cd

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -GwF'
alias ll='ls -alh'

# ls dir color
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# fixes auto complete
# run: '$ compaudit | xargs chmod g-w'
# to fix permissions to remove warnings
autoload -Uz compinit && compinit
