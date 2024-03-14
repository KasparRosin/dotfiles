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

	snap install \
		chezmoi --classic

	# Install Oh-My-Zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	chsh -s $(which zsh)
}

main() {
	setup_packages
}

main "$@"
