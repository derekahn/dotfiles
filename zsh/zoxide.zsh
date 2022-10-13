function _z_cd() {
    cd "$@" || return "$?"

    if [ "$_zo_echo" = "1" ]; then
        echo "$pwd"
    fi
}

function z() {
    if [ "$#" -eq 0 ]; then
        _z_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$oldpwd" ]; then
            _z_cd "$oldpwd"
        else
            echo 'zoxide: $oldpwd is not set'
            return 1
        fi
    else
        _zoxide_result="$(zoxide query -- "$@")" && _z_cd "$_zoxide_result"
    fi
}

function zi() {
    _zoxide_result="$(zoxide query -i -- "$@")" && _z_cd "$_zoxide_result"
}

alias za='zoxide add $PWD'
alias zq='zoxide query'
alias zqi='zoxide query -i'
alias zr='zoxide remove'

function zri() {
    _zoxide_result="$(zoxide query -i -- "$@")" && zoxide remove "$_zoxide_result"
}

function _zoxide_hook() {
    zoxide add "$(pwd -l)"
}
