#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/plugins.vim ~/.vim/plugins.vim
ln -sf $SCRIPT_DIR/.zshrc ~/.zshrc
ln -sf $SCRIPT_DIR/.leptonrc ~/.leptonrc
ln -sf $SCRIPT_DIR/.p10k.zsh ~/.p10k.zsh
sudo ln -sf $SCRIPT_DIR/functions/vtk2png.py /usr/local/bin/vtk2png.py
sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTern.py /usr/local/bin/vtk2pngTern.py
