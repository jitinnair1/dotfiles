#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

#nvim
if [ ! -f ~/.config/nvim/init.lua ]; then
  echo "Neovim may not be installed/set up correctly"
fi
ln -sf $SCRIPT_DIR/config/nvim ~/.config/

#vim
if [ ! -f ~/.vimrc ]; then
  echo "Vim may not be installed/set up correctly."
  echo "Creating a ~/.vimrc file"
  touch ~/.vimrc
fi

if [ ! -f ~/.vim/plugins.vim ]; then
  echo "Vim may not be installed/set up correctly. Trying to create a plugins.vim file"
  mkdir -p ~/.vim/
  echo "Creating a ~/.vim/plugins.vim file"
  touch ~/.vim/plugins.vim
fi

ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/plugins.vim ~/.vim/plugins.vim

#tmux
if [ ! -f ~/.tmux.conf ]; then
  echo "tmux may not be installed/set up correctly. Trying to create a ~/.tmux.conf"
  touch ~/.tmux.conf
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "tpm installed"
fi

ln -sf $SCRIPT_DIR/config/.tmux.conf ~/.tmux.conf

#zsh
if [ ! -f ~/.zshrc ]; then
  echo "zsh may not be installed/set up correctly"
  echo "Creating ~/.zshrc now"
  touch ~/.zshrc
  echo "Created ~/.zshrc"
fi

if [ ! -d ~/.oh-my-zsh ]; then
  echo "oh-my-zsh may not be installed/set up correctly. Installation will be attempted on sourcing ~/.zshrc"
fi

ln -sf $SCRIPT_DIR/.zshrc ~/.zshrc
ln -sf $SCRIPT_DIR/.zshrc-Darwin ~/.zshrc-Darwin
ln -sf $SCRIPT_DIR/.zshrc-Linux ~/.zshrc-Linux

#lepton
ln -sf $SCRIPT_DIR/config/.leptonrc ~/.leptonrc

#powerlevel10k
ln -sf $SCRIPT_DIR/config/.p10k.zsh ~/.p10k.zsh

#iTerm
if [ ! -d '/Applications/iTerm.app' ] && [ ! -d "$HOME/Applications/iTerm.app" ]; then
  echo 'iTerm is not installed'
else
  # Specify the preferences directory
  defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/GitHub/dotfiles/config/"

  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

  echo "iTerm Settings loaded from dotfiles repo"
fi

#Alacritty
if [ ! -d "$HOME/.config/alacritty" ]; then
  mkdir -p ~/.config/alacritty
  cp -r $SCRIPT_DIR/config/alacritty ~/.config
fi

ln -sf $SCRIPT_DIR/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

#Ghostty
if [ ! -d "$HOME/.config/ghostty" ]; then
  mkdir -p ~/.config/ghostty
  cp -r $SCRIPT_DIR/config/ghostty ~/.config/ghostty
fi

ln -sf $SCRIPT_DIR/config/ghostty/config ~/.config/ghostty/config

#Zed
ln -sf $SCRIPT_DIR/config/zed.json ~/.config/zed/settings.json

