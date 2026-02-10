" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation for plugin
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jitinnair1/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'romainl/vim-cool'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'farmergreg/vim-lastplace'
Plug 'mbbill/undotree'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'vim-pandoc/vim-markdownfootnotes'
Plug 'preservim/vim-pencil'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'charlespascoe/vim-go-syntax'
Plug 'ggml-org/llama.vim'
Plug 'jitinnair1/vim-panemaxx'

" Initialize plugin system
call plug#end()
