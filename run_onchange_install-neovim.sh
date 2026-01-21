#!/bin/bash

# Install latest neovim from GitHub releases
NVIM_VERSION="v0.11.5"
curl -fsSL -o /tmp/nvim.tar.gz "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz"
sudo tar -xzf /tmp/nvim.tar.gz -C /usr/local --strip-components=1
