#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

#vim
if [ ! -f ~/.vimrc ]; then
  echo "Vim may not be installed/set up correctly"
  exit 0
fi

ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/plugins.vim ~/.vim/plugins.vim

#zsh
if [ ! -f ~/.zshrc ]; then
  echo "ZSH may not be installed/set up correctly"
  exit 0
fi

if [ ! -d ~/.oh-my-zsh ]; then
  echo "oh-my-zsh may not be installed/set up correctly"
  exit 0
fi

ln -sf $SCRIPT_DIR/.zshrc ~/.zshrc

#lepton
ln -sf $SCRIPT_DIR/.leptonrc ~/.leptonrc

#powerlevel10k
ln -sf $SCRIPT_DIR/.p10k.zsh ~/.p10k.zsh

#custom functions
#sudo ln -sf $SCRIPT_DIR/functions/vtk2png.py /usr/local/bin/vtk2png.py
#sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTernTwoPhase.py /usr/local/bin/vtk2pngTernTwoPhase.py
#sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTernThreePhase.py /usr/local/bin/vtk2pngTernThreePhase.py
#sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTernTwoPhaseClipped.py /usr/local/bin/vtk2pngTernTwoPhaseClipped.py
#sudo ln -sf $SCRIPT_DIR/functions/vtk2pngTernThreePhaseClipped.py /usr/local/bin/vtk2pngTernThreePhaseClipped.py

#TODO
# 1. Create a seperate install.sh for new decive setup
# 2. Clean up functions in zshrc and custom functions here