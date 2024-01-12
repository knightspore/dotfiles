require("catppuccin").setup({
    flavour = "mocha",
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
