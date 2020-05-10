# Docker alias and function

# Cleanup
alias dp="docker system prune"

# Get process included stop container
alias dpa="docker ps -a"

# Shortened docker image
alias di="docker image"

# Get images
alias dis="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Execute interactive container, e.g., $dex base /bin/bash
alias dcu="docker-compose up"

# Execute interactive container, e.g., $dex base /bin/bash
alias dcd="docker-compose down"

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi -f $(docker images -q); }

alias lzy=lazydocker
