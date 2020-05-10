# IP addresses
alias ip="curl ifconfig.me"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Quick DNS configs
alias googDNS="networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4"
alias cloudDNS="networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}
