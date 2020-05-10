# Go Lang
# ---------------
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

export GO111MODULE=auto

alias gt="go test ."
alias gob="go test --bench ."
alias gtc="go test ./... -coverprofile cp.out"
alias gtcm="grep -v -e 1$ cp.out"
