#!/usr/bin/env sh

# NOTES
#
# Install Hack font on host
# Install Rust

# Oh My Fish
curl -L https://get.oh-my.fish | fish

# Tmux Pachage Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

pacman --needed -Syu htop vim tmux neovim fish git wget curl neofetch ldns which
