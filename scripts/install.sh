#!/usr/bin/env

# Install essential packages
apt-get install -y \
    git \
    curl \
    wget \
    zsh \
    stow \
    vim \

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended --keep-zshrc