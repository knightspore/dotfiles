require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "typescript", "c", "lua", "go", "php", "rust", "css" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
