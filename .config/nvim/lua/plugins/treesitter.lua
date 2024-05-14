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
                -- function
                ["af"] = "@call.outer",
                ["if"] = "@call.inner",
                ["am"] = "@function.outer",
                ["im"] = "@function.inner",
                -- class
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                -- block
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                -- loop
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                -- parameter
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                -- statement
                ["as"] = "@statement.outer",
                ["is"] = "@statement.inner",
                -- comment
                ["aa"] = "@comment.outer",
                ["ia"] = "@comment.inner",
                -- assignment
                ["a="] = "@assignment.outer",
                ["i="] = "@assignment.inner",
                ["l="] = "@assignment.lhs",
                ["r="] = "@assignment.rhs",
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
