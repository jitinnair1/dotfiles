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
set number                      "Line numbers are good
set relativenumber              "Line numbers good, relative line numbers better
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set mouse=a                     "Enable mouse and commit blasphemy
set incsearch                   "Highlight as you type
set hlsearch                    "Highlight items found, NOTE: vim-cool plugin automatically removes highlights post search
set termguicolors               "Set colours for theme
set background=dark             "Fix vim colours within tmux
set splitright                  "When spliting, new pane opens right (pun intented)
set scrolloff=8                 "Start auto scroll after 8 lines

" Add Leader
let mapleader="\\"

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

" Vim-airline config
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%p%% %l:%c'
let g:airline#extensions#ale#enabled = 1
let g:airline_section_x = '%{PencilMode()}'

" Fail-safe for vim-airline symbols incase locale is not set (eg. on remote)
set encoding=utf-8

" To get rid of thing like --INSERT--
set noshowmode

" To get rid of display of last command
set noshowcmd

" To get rid of the file name displayed in the command line bar
set shortmess+=F

" To setup fzf in vim
set rtp+=/opt/homebrew/opt/fzf

" OCaml
set rtp^="$HOME/.opam/default/share/ocp-indent/vim"

" Define keybindings for fzf
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>

" Easily toggle NERDTree on/off
noremap <Leader>pv :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Easily toggle Markdown Preview
nmap <Leader>md <Plug>MarkdownPreviewToggle<CR>


" Fix hot loading for bun etc.
set backupcopy=yes

" Persistent undo
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" Toggle Undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" Remove all trailing whitespace by pressing F5
nnoremap <Leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:w<CR>

" Better autocomplete
if v:version >= 900
  set wildoptions=pum           "For pop-up menu, only on vim versions > 9.0
endif
set wildmenu
set wildmode=longest:full,list,full

" Copy using oscyank
nmap <Leader>c <Plug>OSCYankOperator
vmap <Leader>c <Plug>OSCYankVisual

" Copy entrire file to clipboard
noremap <Leader>Y gg"+yG

" LSP
let g:lsp_diagnostics_enabled = 0
let g:lsp_use_native_client = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Autocompletions without auto popup
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" llama.vim
let g:llama_config = { 'show_info': 0 }
let g:llama_config = { 'enable_at_startup': 0 }
noremap <Leader>ll = :LlamaToggle<CR>
