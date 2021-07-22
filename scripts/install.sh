#!/usr/bin/env

echo "Installing packages"

# Install essential packages
sudo apt-get install -y \
    git \
    curl \
    wget \
    zsh \
    stow \
    vim \
    nodejs \
    npm \

# Install common packages required for php
sudo apt-get install -y \
    php-xml \
    php-mbstring \
    php-curl

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended --keep-zshrc

