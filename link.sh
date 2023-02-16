#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

#vim
if [ ! -f ~/.vimrc ]; then
  echo "Vim may not be installed/set up correctly."
  echo "Creating a ~/.vimrc file"
  touch ~./vimrc
fi

if [ ! -f ~/.vim/plugins.vim ]; then
  echo "Vim may not be installed/set up correctly. Trying to create a plugins.vim file"
  if [ ! -d ~/.vim/ ]; then
    echo "Creating a .vim directory"
    mkdir -p ~/.vim/
  fi
  echo "Creating a ~/.vim/plugins.vim file"
  touch  ~./.vim/plugins.vim
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
fi

ln -sf $SCRIPT_DIR/.tmux.conf ~/.tmux.conf

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
ln -sf $SCRIPT_DIR/.zshrc-Darwin ~/.zshrc-Darwin
ln -sf $SCRIPT_DIR/.zshrc-Linux ~/.zshrc-Linux


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
