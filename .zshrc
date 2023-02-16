# First Run Checks
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
  git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
  git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
fi

# Automatically update oh-my-zsh
zstyle ':omz:update' mode auto

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

# Save History only upto 1000 items
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
  sudo
  copypath
  copyfile
  debian
  autoupdate
  zsh-fzf-history-search
  zsh-z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Disable bracketed-magic-paste to fix slow paste
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# Set language environment
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# Go Path
export GOPATH=/Users/$USER/go
export PATH=$GOPATH/bin:$PATH

# Aliases
alias zconfig="vi ~/.zshrc"
alias zsource="source ~/.zshrc"
alias viconfig="vi ~/.vimrc"
alias untar='tar -zxvf'
alias p10k_upgrade="git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull"

# thefuck config
eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autoload zsh functions
fpath+=~/GitHub/dotfiles/zshfunctions

# zsh functions
autoload make_gif
autoload mdpdf
autoload mkrep
autoload horgrid
autoload vergrid
autoload fourgrid

# Load .zshrc specific to OS
source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"
