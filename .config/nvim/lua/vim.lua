-- VIM Settings

vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.cmd(":set nowrap")

vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.undodir = '/Users/c/.vim/undodir'
vim.opt.undofile = true

vim.opt.scrolloff = 12
-- vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"

vim.g.netrw_browse_split = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

-- Minimap
vim.g.minimap_auto_start = 0
vim.g.minimap_width = 10

-- Wrap Markdown
vim.cmd([[
augroup Markdown
  autocmd!
    autocmd FileType markdown set wrap
    augroup END
]])
