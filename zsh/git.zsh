alias only1="git branch | grep -v \"master\" | xargs git branch -D"

# Interactively add selected parts of files
alias gaap="git add -p"
alias gsp="git stash -p"

# git whatchanged
gwtf() {
  git whatchanged --since="$1"
}
alias ghot = 'git log --format=format: --name-only | egrep -v '^$' | sort | uniq -c | sort -rg | head -10'
