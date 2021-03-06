#!/bin/bash

# You'll need to generate an ssh key in order to clone the dotfiles:
#   ssh-keygen -t rsa -C "matt@rathbun.cc" -b 4096

# TODO ripgrep
# TODO docker and docker-compose (ugh docker in debian is something else)
# TODO get a newer nodejs

source $(dirname "$0")/common.sh

# Function to install something using apt
installApt () {
  if [ $# -eq 1 ]; then
    installMaybe $1 "sudo apt install -y $1"
  else
    installMaybe $1 "sudo apt install -y $2"
  fi
}

# Some prerequisites to install other things
installApt curl
installApt git

# zsh
installApt zsh

# neovim with python
installApt nvim neovim
installApt pip2 python-pip
installApt pip3 python3-pip
pip2 install --user neovim
pip3 install --user neovim

# extras
installApt thefuck
installApt htop
installApt fzf
installApt mc
installApt terminator
installApt iputils-ping
apt install fonts-hack-otf

# ripgrep (through cargo, seriously it's the easiest way)
installMaybe cargo "curl https://sh.rustup.rs -sSf | sh"
installMaybe rg "cargo install ripgrep"
installMaybe bat "cargo install bat"

# node
installApt node nodejs
source $(dirname "$0")/npm.sh

# set default shell to zsh
sudo chsh -s /usr/bin/zsh $USER


echo "All done!"
