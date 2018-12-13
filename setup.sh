#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Install some useful tools
apt update -y
apt upgrade -y
apt install git vim curl tmux xclip powerline fonts-powerline curl openvpn megasync dolphin-megasync octave weka sqlitebrowser wireshark sqlmap audacity gimp python3-pip vlc graphviz -y
add-apt-repository ppa:papirus/papirus -y
apt update -y
apt install papirus-icon-theme -y

# Download dotfiles
curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.bashrc > ~/.bashrc
curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.tmux.conf > ~/.tmux.conf
curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.vimrc > ~/.vimrc

# Install vim plugins
vim +PluginInstall +qall
