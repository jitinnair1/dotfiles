#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/plugins.vim ~/.vim/plugins.vim
ln -sf $SCRIPT_DIR/.zshrc ~/.zshrc
ln -sf $SCRIPT_DIR/.leptonrc ~/.leptonrc
ln -sf $SCRIPT_DIR/.p10k.zsh ~/.p10k.zsh
sudo ln -sf $SCRIPT_DIR/functions/vtk2png.py /usr/local/bin/vtk2png.py
sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTernTwoPhase.py /usr/local/bin/vtk2pngTernTwoPhase.py
sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTernThreePhase.py /usr/local/bin/vtk2pngTernThreePhase.py
sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTernTwoPhaseClipped.py /usr/local/bin/vtk2pngTernTwoPhaseClipped.py
sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTernThreePhaseClipped.py /usr/local/bin/vtk2pngTernThreePhaseClipped.py
