# Interactively add selected parts of files
alias gaap="git add -p"
alias gsp="git stash -p"
alias gac="!git add -A && git commit -m"
alias gbc="git branch | fzf | xargs git checkout"
alias gbdd="git branch | fzf | xargs git branch -D"

alias gtop="mergestat 'select count (*), author_name from commits group by author_name order by count (*) desc'"


# Pushes the current branch to a designated remote; defaults to "origin"
function gpb() {
  git push -u "${1:-origin}" $(git branch --show-current)
}

# To delete local branches which have already been merged into $1:
function gclean() {
  git branch --merged "$1" | grep -v "\* $1" | xargs -n 1 git branch -d
}

# Lazily clone and cd into it
function gclone() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# hot paths for project
function ghot() {
  git log --format=format: --name-only | egrep -v '^$' | sort | uniq -c | sort -rg | head -10
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
  mkdir -p "$1"
  git archive development | tar -x -C "$1"
}

# If you change repos in lazygit and want your shell
# to change directory into that repo on exiting lazygit
function lg() {
  export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

  lazygit "$@"

  if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
          cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
          rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
  fi
}

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
function current_branch() {
  git_current_branch
}


# Interactively add selected parts of files
alias gaap="git add -p"
alias gsp="git stash -p"
alias gac="!git add -A && git commit -m"
alias gbc="git branch | fzf | xargs git checkout"
alias gbdd="git branch | fzf | xargs git branch -D"

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}

# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in main trunk; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo master
}

alias ga='git add'
alias gb='git branch'
alias gc!='git commit -v --amend'
alias gcmsg='git commit -m'
alias gco='git checkout'

alias gd='git diff'
alias gdcw='git diff --cached --word-diff'
alias gdw='git diff --word-diff'

alias gf='git fetch'
alias gfo='git fetch origin'

alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'

alias gl='git pull'

alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glp="_git_log_prettily"

alias gm='git merge'
alias gmom='git merge origin/$(git_main_branch)'

alias gp='git push'
alias gpf!='git push --force'
alias gpu='git push upstream'

alias gr='git remote'

alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'

alias gst='git status'

alias gsta='git stash save'
alias gstc='git stash clear'
alias gstl='git stash list'
alias gstp='git stash pop'

alias glc='git rev-parse --verify HEAD | pbcopy'
