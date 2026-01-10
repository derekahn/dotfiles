# Python - dynamically find user site-packages bin
for pyver in 3.13 3.12 3.11 3.10; do
    pypath="$HOME/Library/Python/$pyver/bin"
    if [[ -d "$pypath" ]]; then
        export PATH="$PATH:$pypath"
        break
    fi
done

alias python=python3
