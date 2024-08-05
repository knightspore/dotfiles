require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    styles = {
        comments = { "italic" },
    },
    integrations = {
        treesitter = true,
        mason = true,
        harpoon = true,
        telescope = {
            enabled = true,
        },
    },
})
vim.o.termguicolors = true
vim.cmd.colorscheme "catppuccin"
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'catppuccin'

-- vim-nerdtree-syntax-highlight

vim.g.WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
vim.g.WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

vim.g.NERDTreeFileExtensionHighlightFullName = 1
vim.g.NERDTreeExactMatchHighlightFullName = 1
vim.g.NERDTreePatternMatchHighlightFullName = 1

vim.g.NERDTreeHighlightFolders = 1
vim.g.NERDTreeHighlightFoldersFullName = 1

-- color higlight
require('nvim-highlight-colors').setup({
    enable_tailwind = true,
})
