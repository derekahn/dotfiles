# Interactively add selected parts of files
alias gaap="git add -p"
alias gsp="git stash -p"

gclone() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# hot paths for project
ghot() {
  git log --format=format: --name-only | egrep -v '^$' | sort | uniq -c | sort -rg | head -10
}
