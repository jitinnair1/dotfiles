" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation for plugin
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'romainl/vim-cool'
Plug 'dense-analysis/ale'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Initialize plugin system
call plug#end()
