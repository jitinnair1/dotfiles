" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

so ~/.vim/plugins.vim

" ================ General Config ====================

set relativenumber              "Line numbers good, relative line numbers better
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set mouse=a                     "Enable mouse scroll and commit blasphemy
set incsearch                   "Highlight as you type
set hlsearch                    "Highlight items found, NOTE: vim-cool plugin automatically removes highlights post search
set termguicolors               "Set colours for theme

" Turn on syntax highlighting
syntax on

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" ================ Others ===========================

" For lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha', 
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" To get rid of thing like --INSERT--
set noshowmode

" To get rid of display of last command
set noshowcmd 

" To get rid of the file name displayed in the command line bar
set shortmess+=F 

" To setup fzf in vim
set rtp+=/opt/homebrew/opt/fzf

" Easily toggle NERDTree on/off
noremap <F10> :NERDTreeToggle<CR>

" Easily toggle Markdown Preview
nmap <F6> <Plug>MarkdownPreviewToggle<CR>

