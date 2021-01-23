PROJECTNAME=$(shell basename "$(PWD)")

M = $(shell printf "\033[34;1m▶\033[0m")
DONE="\n  $(M)  done ✨"

.PHONY: help
all: help
help: Makefile
	@echo
	@echo " Choose a command to run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## install: Installs brew, brew packages, go, etc
install:
	@echo "\nRunning "$(PROJECTNAME)"/bin/install.sh\n"
	./bin/install.sh
	@echo $(DONE)

## link: symlinks tmux, vim, neovim, zsh, etc
link:
	@echo "\nRunning "$(PROJECTNAME)"/bin/link.sh\n"
	./bin/link.sh
	@echo $(DONE)
