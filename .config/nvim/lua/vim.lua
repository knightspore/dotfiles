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

vim.cmd(":set list")
-- tab, space, eol, trail
vim.cmd(":set listchars=tab:»·,trail:-,space:·,")

-- Wrap Markdown
vim.cmd([[
augroup Markdown
  autocmd!
    autocmd FileType markdown set wrap
    augroup END
]])

-- Associate .vs, .fs with .glsl
vim.cmd([[
augroup GLSL
    autocmd!
    autocmd BufNewFile,BufRead *.vs,*.fs set ft=glsl
    augroup END
]])

-- Function to open a Telescope-like floating terminal
function _G.open_floating_terminal()
    local width = 100
    local height = 30
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'rounded',
    })

    -- vim.api.nvim_win_set_option(win, 'winhl', 'NormalFloat:NormalFloat,BorderFloat:FloatBorder')
    vim.api.nvim_command('terminal')
    vim.api.nvim_command('startinsert')
end

-- Map <leader>t to open the floating terminal
vim.api.nvim_set_keymap('n', '<leader><S-t>', ':lua open_floating_terminal()<CR>', { noremap = true, silent = true })

-- Set up highlight groups for the floating window
vim.cmd([[
    highlight NormalFloat guibg=#1f2335
    highlight FloatBorder guifg=#737aa2 guibg=#1f2335
]])
