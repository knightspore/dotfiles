require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "html", "javascript", "typescript", "c", "lua", "go", "php", "rust", "css", "jsdoc", "comment",
        "bash", "markdown", "yaml" , "twig", "sql"},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "php" },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                ["as"] = "@statement.outer",
                ["is"] = "@statement.inner",
                ["aa"] = "@comment.outer",
                ["ia"] = "@comment.inner",
            },
            selection_modes = {
                ['@function.inner'] = 'v',
                ['@function.outer'] = 'V',
                ['@class.inner'] = 'v',
                ['@class.outer'] = 'V',
                ['@block.inner'] = 'v',
                ['@block.outer'] = 'V',
                ['@loop.inner'] = 'v',
                ['@loop.outer'] = 'V',
                ['@parameter.inner'] = 'v',
                ['@parameter.outer'] = 'V',
                ['@statement.inner'] = 'v',
                ['@statement.outer'] = 'V',
                ['@comment.inner'] = 'v',
                ['@comment.outer'] = 'V',
            }
        }
    }
}
