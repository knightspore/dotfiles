require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "html", "javascript", "typescript", "c", "lua", "go", "php", "rust", "css", "jsdoc", "comment",
        "bash", "markdown", "yaml" , "twig", "sql"},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "php" },
    },
}
