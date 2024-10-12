" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation for plugin
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'romainl/vim-cool'
Plug 'dense-analysis/ale'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'farmergreg/vim-lastplace'
Plug 'mbbill/undotree'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

" Initialize plugin system
call plug#end()
