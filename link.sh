#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/.vim/plugins.vim ~/plugins.vim
ln -sf $SCRIPT_DIR/.zshrc ~/.zshrc
ln -sf $SCRIPT_DIR/.leptonrc ~/.leptonrc
ln -sf $SCRIPT_DIR/.p10k.zsh ~/.p10k.zsh

