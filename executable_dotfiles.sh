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

setup_node() {
	# Install node
	\. "$NVM_DIR/nvm.sh"
	nvm install node -lts
}

setup_php() {
	if [ ! -f /usr/local/bin/composer ]; then
		# Download and install Composer
		php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
		php composer-setup.php --quiet
		php -r "unlink('composer-setup.php');"
		sudo mv composer.phar /usr/local/bin/composer
		sudo chmod 777 /usr/local/bin/composer
		echo "Composer installed successfully!"
	fi
}

main() {
	# Setups
	setup_packages
	setup_node
	setup_php
}

main "$@"
