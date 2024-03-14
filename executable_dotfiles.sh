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

	# Install snap packages
	sudo snap install \
		chezmoi --classic
}

main() {
	# Setups
	setup_packages

	# Install node
	\. "$NVM_DIR/nvm.sh"
	nvm install node -lts
}

main "$@"
