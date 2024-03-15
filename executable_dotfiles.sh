#!/bin/sh

setup_packages() {
        # Add required repositories 
	sudo add-apt-repository -y ppa:neovim-ppa/unstable # neovim
	sudo add-apt-repository -y ppa:ondrej/php # php

	# Install required packages
	sudo apt update && sudo apt install -y \
    		curl \
		neovim \
		ripgrep \
		gcc \
		unzip \
		ca-certificates \
		software-properties-common \
		php8.2 \
		php8.2-cli \
		php8.2-mysql \
		php8.2-pgsql

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
