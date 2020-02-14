# Go Lang
# ---------------
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$HOME/go/bin
export GOROOT=/usr/local/opt/go/libexec

alias gt="go test ."
alias gob="go test --bench ."
alias gtc="go test ./... -coverprofile cp.out"
alias gtcm="grep -v -e 1$ cp.out"

# toogle go v1.11 module support
# export GO111MODULE=on
