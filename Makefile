PROJECTNAME=$(shell basename "$(PWD)")

M = $(shell printf "\033[34;1m▶\033[0m")
DONE="\n  $(M)  done ✨"

.PHONY: help all setup install link update clean doctor

all: help

help: Makefile
	@echo
	@echo " Choose a command to run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## setup: One-click setup - installs everything and creates symlinks
setup: install link
	@echo $(DONE)
	@echo "\n  $(M)  Setup complete! Restart your terminal, then run 'make doctor' to verify."

## doctor: Verifies configs load, symlinks resolve, and tools exist
doctor:
	@echo "\n  $(M)  Running doctor.sh\n"
	@./bin/doctor.sh
	@echo $(DONE)

## install: Installs Homebrew, packages, languages (Go, Rust, Node)
install:
	@echo "\n  $(M)  Running install.sh\n"
	@./bin/install.sh
	@echo $(DONE)

## link: Creates symlinks for configs (tmux, nvim, zsh, etc)
link:
	@echo "\n  $(M)  Running link.sh\n"
	@./bin/link.sh
	@echo $(DONE)

## link-force: Creates symlinks, replacing existing files
link-force:
	@echo "\n  $(M)  Running link.sh --force\n"
	@./bin/link.sh --force
	@echo $(DONE)

## update: Updates Homebrew packages and plugins
update:
	@echo "\n  $(M)  Updating Homebrew packages\n"
	@brew update && brew upgrade
	@echo "\n  $(M)  Updating zsh-autosuggestions\n"
	@git -C ~/.zsh/zsh-autosuggestions pull 2>/dev/null || true
	@echo "\n  $(M)  Updating TPM plugins\n"
	@~/.tmux/plugins/tpm/bin/update_plugins all 2>/dev/null || true
	@echo $(DONE)

## clean: Removes broken symlinks in ~ and ~/.config
clean:
	@echo "\n  $(M)  Removing broken symlinks\n"
	@find ~ -maxdepth 1 -type l ! -exec test -e {} \; -delete 2>/dev/null || true
	@find ~/.config -maxdepth 1 -type l ! -exec test -e {} \; -delete 2>/dev/null || true
	@echo $(DONE)

## lint: Runs shellcheck on scripts
lint:
	@echo "\n  $(M)  Running shellcheck\n"
	@shellcheck bin/*.sh
	@echo $(DONE)
