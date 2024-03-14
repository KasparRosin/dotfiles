#!/bin/sh

setup_packages() {
        # Add required repositories 
	sudo add-apt-repository -y \
		ppa:neovim-ppa/unstable

	# Install required packages
	sudo apt update && sudo apt install -y \
    		curl \
		neovim \
		ripgrep \
		gcc

	sudo snap install \
		chezmoi --classic
}

main() {
	# Setups
	setup_packages

	# Make zsh as default shell
	chsh -s $(which zsh)
}

main "$@"
