-- VIM Settings
vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.cmd(":set nowrap")

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.numberwidth = 1

vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"

vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Wrap Markdown
vim.cmd([[
augroup Markdown
  autocmd!
    autocmd FileType markdown set wrap
    augroup END
]])
