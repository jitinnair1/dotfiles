#!/bin/bash

DOTFILES_DIR="$HOME/GitHub/dotfiles"
TARGET_DIR="$HOME"

cd "$DOTFILES_DIR"

echo "Removing stow-managed symlinks"
stow --target="$TARGET_DIR" --delete --verbose shell nvim tmux alacritty ghostty zed others i3 vim

echo "Done"

