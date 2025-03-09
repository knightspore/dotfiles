-- VIM Settings
vim.g.mapleader = " "

-- Grouped settings 

vim.cmd(":set nowrap")

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.numberwidth = 1

vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.undolevels = 5000

vim.opt.scrolloff = 8
vim.opt.incsearch = true

vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.cmd(":set list")
-- tab, space, eol, trail
vim.cmd(":set listchars=tab:»·,trail:-,space:·,")

-- Autocommands for file association
local autocmds = {
    { 'Markdown', '*.md', 'set wrap' },
    { 'GLSL', '*.vs,*.fs', 'set ft=glsl' },
    { 'Blade', '*.blade.php', 'set ft=html' },
    { 'Nginx', '*/server_config/*', 'set ft=nginx' },
}

for _, autocmd in ipairs(autocmds) do
    vim.api.nvim_create_autocmd('BufEnter', {
        desc = 'Set filetype to ' .. autocmd[1],
        pattern = autocmd[2],
        command = autocmd[3],
    })
end
