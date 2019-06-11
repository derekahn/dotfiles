# Docker alias and function

# Shorten command
alias dcc="docker-compose"

alias dclt="docker-compose logs --tail=100 -f"

# Cleanup
alias dp="docker system prune"

# Remove Exited containers
alias drmex="docker rm $(docker ps -q -f "status=exited")"

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Shortened docker image
alias di="docker image"

# Get images
alias dis="docker images"

# list dangling images
alias dilsd="docker images -f dangling=true"

# Remove dangling images
alias dirmd="docker rmi $(docker images -f dangling=true -q)"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias drit="docker run -it"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Lis all exited containers
alias dlse="docker ps -a -f status=exited"

# Remove all exited containers
alias drme="docker rm $(docker ps -a -f status=exited -q)"

# Execute interactive container, e.g., $dex base /bin/bash
alias dcu="docker-compose up"

# Execute interactive container, e.g., $dex base /bin/bash
alias dcd="docker-compose down"

# Remove all untagged images
alias drmtag="docker rmi $(docker images | grep "^<none>" | awk "{print $3}")"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi -f $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
