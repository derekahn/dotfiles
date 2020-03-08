# Go Lang
# ---------------
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

export GO111MODULE=auto

alias gt="go test ."
alias gob="go test --bench ."
alias gtc="go test ./... -coverprofile cp.out"
alias gtcm="grep -v -e 1$ cp.out"

# toogle go v1.11 module support
# export GO111MODULE=on
