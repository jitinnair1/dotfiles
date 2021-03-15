# Console initialisation code to be run before p10k prompt 
plugins=(
  ssh-agent
)


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Save History only upto 100 items
HISTSIZE=1000
SAVEHIST=1000

# Set name of the theme to load
ZSH_THEME=powerlevel10k/powerlevel10k

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
 plugins=(
  git
  github
  sudo
  copydir
  copyfile
  osx
  debian
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Disable bracketed-magic-paste to fix slow paste
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# Set language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Aliases
alias zshconfig="vi ~/.zshrc"
alias viconfig="vi ~/.vimrc"
alias sscu="ssh jitins@10.96.19.245"
alias cray="ssh metnair@xc40.serc.iisc.ernet.in"
alias cahn="ssh jitin@10.194.12.38"
alias abhikmmg="ssh abhikmmg@10.194.33.32"
alias untar='tar -zxvf'
alias gclus="ssh jitin@10.194.33.12"
alias p10k_upgrade="git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull"

#thefuck config
eval $(thefuck --alias)

#To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#VTK Libraries
export PATH=/usr/local/vtk/:$PATH
export DYLD_LIBRARY_PATH=/usr/local/vtk/:$DYLD_LIBRARY_PATH

#zsh functions
make_gif(){
  convert -delay $1 -loop 0 "${@:2}" myimage.gif
}

mdpdf(){
  pandoc -V geometry:margin=0.8in $@ -s -o "${$(echo "$@" | cut -f 1 -d '.')}".pdf --pdf-engine=xelatex;
}

mkrep(){
cat <<EOT >> temp.txt
---
header-includes:
 - \usepackage{fvextra}
 - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\\\{\}}
---


EOT

frontmatter='~~~'
frontmatter="$frontmatter$1"
for eachfile in ${@:2}
do
  filename=$(echo $eachfile | cut -f 1 -d '.')
	touch $filename.md
  echo "$frontmatter" >> "$filename.md"
  cat $eachfile >> $filename.md
	echo '\n~~~' >> $filename.md
  cat $filename.md >> temp.txt
  mv temp.txt $filename.md
	pandoc -V geometry:margin=1in $filename.md -s --pdf-engine=xelatex -o $filename.pdf
  rm $filename.md
done
}

horgrid(){
  montage -mode concatenate -geometry +2+2 -label "%t" -font Helvetica -pointsize 32 -tile 2x1 $1 $2 grid_horizontal.png;
}

vergrid(){
  montage -mode concatenate -geometry +2+2 -label "%t" -font Helvetica -pointsize 32 -tile 1x2 $1 $2 grid_vertical.png;
}

fourgrid(){
  montage -mode concatenate -geometry +2+2 -label "%t" -font Helvetica -pointsize 32 -tile 2x2 $1 $2 $3 $4 grid.png;
}
