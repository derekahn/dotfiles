# Docker alias and function

# Cleanup
alias dp="docker system prune"

# Remove Exited containers
alias drmex="docker rm $(docker ps -q -f "status=exited")"

# Get latest container ID
alias dl="docker ps -l -q"

# Get process included stop container
alias dpa="docker ps -a"

# Shortened docker image
alias di="docker image"

# Get images
alias dis="docker images"

# list dangling images
alias dilsd="docker images -f dangling=true"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

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

alias lzy=lazydocker
