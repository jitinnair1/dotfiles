#!/bin/bash

DOTFILES_DIR="$HOME/GitHub/dotfiles"
TARGET_DIR="$HOME"

cd "$DOTFILES_DIR"

echo "Installing dotfiles from $DOTFILES_DIR to $TARGET_DIR"

#stow
stow --target="$TARGET_DIR" --verbose shell nvim tmux alacritty ghostty zed others vim i3

#tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "tpm installed"
fi

#iTerm preferences (if on macOS)
if [[ "$OSTYPE" == "darwin"* ]] && [ -d '/Applications/iTerm.app' ]; then
    defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DOTFILES_DIR/config/"
    defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
    echo "iTerm Settings loaded from dotfiles repo"
fi

echo "Done"
