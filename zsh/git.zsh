# Interactively add selected parts of files
alias gaap="git add -p"
alias gsp="git stash -p"
alias gac="!git add -A && git commit -m"
alias gbc="git branch | fzf | xargs git checkout"
alias gbdd="git branch | fzf | xargs git branch -D"


# To delete local branches which have already been merged into $1:
gclean() {
  git branch --merged "$1" | grep -v "\* $1" | xargs -n 1 git branch -d
}

# Lazily clone and cd into it
gclone() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# hot paths for project
ghot() {
  git log --format=format: --name-only | egrep -v '^$' | sort | uniq -c | sort -rg | head -10
}

# take this repo and copy it to somewhere else minus the .git stuff.
gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

# If you change repos in lazygit and want your shell
# to change directory into that repo on exiting lazygit
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}
