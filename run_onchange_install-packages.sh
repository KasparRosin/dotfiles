#!/bin/bash

echo "Installing packages and other tools.."
sudo apt update && sudo apt install -y \
        build-essential \
    curl \
    wget \
    git \
    zsh \
    tmux \
    fzf \
    ripgrep \
    fd-find \
    bat \
    jq \
    htop \
    tree \
    unzip \
    lazygit \
    postgresql \
    postgresql-contrib \
    sqlite3

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Installing Node Version Manager..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
