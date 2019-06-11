####################
# functions
####################
function 7zip() {
  tar cf - "$@" | 7za a -si "$@".tar.7z;
}

function 7unzip() {
  7za x -so "$@" | tar xf -;
}

# override cd to (cd && ls)
function cd {
  builtin cd "$@" && ls
}

# find shorthand
function f() {
  find . -name "$1"
}

# Start an HTTP server from a directory, optionally specifying the port
function startFileServer() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  http-server -p 8000
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

# get gzipped size
function gzsize() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# unzip tar.gz
function untargz() {
  echo "orig size    (bytes): "
  gunzip -c "$1" | tar xopf -
}

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Man Command colorizer
man() {
	env \
		LESS_TERMCAP_md=$'\e[1;36m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
			man "$@"
}
