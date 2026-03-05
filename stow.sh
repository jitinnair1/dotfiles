#!/bin/bash

DOTFILES_DIR="$HOME/GitHub/dotfiles"
TARGET_DIR="$HOME"

cd "$DOTFILES_DIR"

echo "Installing dotfiles from $DOTFILES_DIR to $TARGET_DIR"

#stow
stow --target="$TARGET_DIR" --verbose shell nvim tmux alacritty ghostty zed others vim opencode

#tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "tpm installed"
fi

echo "Done"
