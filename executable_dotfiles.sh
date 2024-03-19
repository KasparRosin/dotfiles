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
		php8.2-pgsql \
		php8.2-mbstring \
		php8.2-xml \
		php8.2-zip \
		php8.2-curl \
		php8.2-redis

	# Install snap packages
	sudo snap install chezmoi --classic
	sudo snap install redis
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

setup_postgres() {
	# Create the file repository configuration & import the repository signing key
	sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

	sudo apt update
	sudo apt -y install postgresql-16
}

main() {
	# Setups
	setup_packages
	setup_node
	setup_php
	setup_postgres
}

main "$@"
