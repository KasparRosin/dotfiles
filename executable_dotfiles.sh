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
		chezmoi
}

main() {
	setup_packages
}

main "$@"
