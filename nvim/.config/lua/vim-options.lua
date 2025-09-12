vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- From my vimrc
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set noshowmode")
vim.cmd("set noshowcmd")
vim.cmd("set shortmess+=F")

-- Map leader to /
vim.g.mapleader = '/'

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Backup
vim.opt.backup = false
vim.opt.swapfile = false
