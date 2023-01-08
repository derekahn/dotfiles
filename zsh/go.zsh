# Go Lang
# ---------------
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export GO111MODULE=auto

alias gt="go test ."
alias gob="go test --bench ."
alias gtcm="grep -v -e 1$ cp.out"
alias sc="staticcheck"
alias sca="staticcheck ./..."

function gtc() {
	go test ./... -coverprofile cp.out
	rm cp.out
}

# Satic code analyis (https://staticcheck.io)
function sce() {
	issue=$(echo $1 | tr '[:lower:]' '[:upper:]')
	staticcheck -explain $issue
}

function goenv() {
	export $(cat .env | grep -o '^[^#]*' | xargs)
}
