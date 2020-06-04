# Interactively add selected parts of files
alias gaap="git add -p"
alias gsp="git stash -p"
alias gac="!git add -A && git commit -m"




# To delete local branches which have alread been merged into $1:
gclean() {
  git branch --merged "$1" | grep -v "\* $1" | xargs -n 1 git branch -d
}

gclone() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# hot paths for project
ghot() {
  git log --format=format: --name-only | egrep -v '^$' | sort | uniq -c | sort -rg | head -10
}
