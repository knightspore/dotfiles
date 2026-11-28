-- GLOBAL OPTIONS

vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.numberwidth = 1
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.undolevels = 5000
vim.opt.scrolloff = 8
vim.opt.updatetime = 200
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- KEYMAPS

vim.keymap.set('n', '<leader>s', ':w<CR>')                    -- Save file
vim.keymap.set('n', '<leader>q', ':q<CR>')                    -- Quit
vim.keymap.set('n', '<leader>z', ':set wrap!<CR>')            -- Toggle Wrap
vim.keymap.set('n', ']t', ':tabnext<CR>')                     -- Tab Next
vim.keymap.set('n', '[t', ':tabprev<CR>')                     -- Tab Prev
vim.keymap.set('n', "n", "nzzzv")                             -- Center Next Search
vim.keymap.set('n', "N", "Nzzzv")                             -- Center Prev Search
vim.keymap.set('n', "<leader>y", "\"+y")                      -- Copy to System Clipboard
vim.keymap.set('v', "<leader>y", "\"+y")                      -- Copy to System Clipboard
vim.keymap.set('n', "<leader>Y", "\"+Y")                      -- Copy to System Clipboard
vim.keymap.set('n', '<leader>w', ':NERDTreeToggle<CR>', {})   -- Toggle File Manager
vim.keymap.set('n', '<leader><S-w>', ':NERDTreeFind<CR>', {}) -- Open File Manager on Current File
vim.keymap.set('n', '<leader><S-g>', ':G ', {})               -- Git prefix

-- PLUGINS

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local cmds = {
            ['nvim-treesitter'] = 'TSUpdate',
            ['vim-go'] = 'GoUpdateBinaries',
        }
        local cmd = cmds[ev.data.spec.name]
        if cmd and (ev.data.kind == 'install' or ev.data.kind == 'update') then
            if not ev.data.active then vim.cmd.packadd(ev.data.spec.name) end
            vim.cmd(cmd)
        end
    end,
})

vim.pack.add({
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/fatih/vim-go',
    'https://github.com/folke/trouble.nvim',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-ui-select.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
    'https://github.com/preservim/nerdtree',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/tpope/vim-surround',
    { src = 'https://github.com/nvim-telescope/telescope.nvim',               version = "master" },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter',             version = "main" },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = "main" },
    { src = 'https://github.com/catppuccin/nvim',                             name = "catppuccin" },
})

-- THEME

require("catppuccin").setup({
    flavour = vim.o.background == "dark" and "mocha" or "latte",
    transparent_background = true,
    styles = { comments = { "italic" } },
    integrations = {
        cmp = true,
        markdown = true,
        mason = true,
        treesitter = true,
        lsp_trouble = true,
        telescope = { enabled = true },
    },
})

require('nvim-highlight-colors').setup({ enable_tailwind = true })

vim.cmd.colorscheme "catppuccin"

-- LSP

vim.lsp.config("*", {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.keymap.set({ "n", "x" }, "<leader>p", function()
            -- Get file type
            local ft = vim.bo.filetype
            local filepath = vim.fn.expand("%:p")

            -- Custom Formatter Commands
            local commands = {
                php = function()
                    if filepath:find("/services/travel/lavender/") then
                        -- Laravel - Pint
                        local config = os.getenv("HOME") ..
                            "/Developer/stack/services/travel/lavender/pint.json"
                        vim.cmd("!pint --config=" .. config .. " " .. filepath)
                    elseif filepath:find("/services/travel/") then
                        -- Travel - PHP-CS-Fixer
                        local config = os.getenv("HOME") ..
                            "/Developer/stack/utilities/php-cs-fixer/.php-cs-fixer.dist.php"
                        vim.cmd("!PHP_CS_FIXER_IGNORE_ENV=1 php-cs-fixer fix --config=" .. config .. " " .. filepath)
                    end
                end,
            }

            if commands[ft] then
                commands[ft]()
            else
                vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
            end
        end, { buffer = args.buf })
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = args.buf })
    end,
});

require('mason').setup({})

local lsps = {
    { "bashls" }, { "clangd" }, { "cssls" }, { "dockerls" }, { "eslint" }, { "gopls" }, { "gdscript" }, { "gdshader" }, { "html" }, { "jsonls" }, { "marksman" }, { "tailwindcss" }, { "ts_ls" }, { "yamlls" },
    { "emmet_ls", {
        filetypes = { "html", "css", "markdown", "php", "blade", "typescriptreact", "typescript" } }
    },
    { "lua_ls", {
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false, },
                telemetry = { enable = false }
            },
        }
    }
    },
    { "phpactor", {
        filetypes = { "php", "blade" },
        init_options = {
            ["language_server_worse_reflection.inlay_hints.enable"] = true,
            ["language_server_worse_reflection.inlay_hints.types"] = true,
            ["language_server_configuration.auto_config"] = false,
            ["code_transform.import_globals"] = true,
            ["language_server_phpstan.enabled"] = true,
            ["language_server_phpstan.bin"] = os.getenv("HOME") .. "/.config/composer/vendor/bin/phpstan",
            ["symfony.enabled"] = true,
        }
    }
    }
}

for _, lsp in pairs(lsps) do
    local name, config = lsp[1], lsp[2]
    vim.lsp.enable(name)
    if config then
        vim.lsp.config(name, config)
    end
end

vim.keymap.set('n', 'gr', ':Trouble lsp_references<CR>', {})      -- LSP References
vim.keymap.set('n', 'gd', ':Trouble lsp_definitions<CR>', {})     -- LSP Definitions
vim.keymap.set('n', 'gD', ':Trouble diagnostics<CR>', {})         -- LSP Diagnostics
vim.keymap.set('n', 'gI', ':Trouble lsp_implementations<CR>', {}) -- LSP Implementations
vim.keymap.set('n', '<leader>t', ':Trouble<CR>', {})              -- Trouble open command

vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        show_header = true,
        border = "single",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ✘',
            [vim.diagnostic.severity.WARN] = ' ⚠',
            [vim.diagnostic.severity.HINT] = ' ⚑',
            [vim.diagnostic.severity.INFO] = ' ℹ'
        }
    }
})

-- Show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd({ "CursorHold" }, {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})


-- COMPLETION

local cmp = require('cmp')

cmp.setup({
    sources = { { name = 'path' }, { name = 'nvim_lsp' }, { name = 'buffer', keyword_length = 3 }, },
    snippet = { expand = function(args) vim.snippet.expand(args.body) end },
    mapping = cmp.mapping.preset.insert({
        -- Autocompletion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
})

-- TREESITTER
local parsers = { "bash", "c", "comment", "css", "go", "html", "javascript", "jsdoc", "json", "lua", "markdown", "php",
    "python", "rust", "sql", "tsx", "twig", "typescript", "vim", "vimdoc", "yaml" }

require("nvim-treesitter").install(parsers)

vim.treesitter.language.register("tsx", "javascriptreact")
vim.treesitter.language.register("tsx", "typescriptreact")

-- highlight + indent, per buffer
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

-- additional_vim_regex_highlighting equivalent for php/markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "php", "markdown" },
    callback = function(args)
        vim.bo[args.buf].syntax = "on"
    end,
})

-- DISABLED TO SEE IF I STILL USE IT
-- require("nvim-treesitter-textobjects").setup({
--     select = {
--         lookahead = true,
--         selection_modes = {
--             ['@function.inner'] = 'v',
--             ['@function.outer'] = 'V',
--             ['@class.inner'] = 'v',
--             ['@class.outer'] = 'V',
--             ['@block.inner'] = 'v',
--             ['@block.outer'] = 'V',
--             ['@loop.inner'] = 'v',
--             ['@loop.outer'] = 'V',
--             ['@parameter.inner'] = 'v',
--             ['@parameter.outer'] = 'V',
--             ['@statement.inner'] = 'v',
--             ['@statement.outer'] = 'V',
--             ['@comment.inner'] = 'v',
--             ['@comment.outer'] = 'V',
--         },
--     },
-- })
--
-- local ts_select = require("nvim-treesitter-textobjects.select")
-- local objects = {
--     ["af"] = "@call.outer",
--     ["if"] = "@call.inner",
--     ["am"] = "@function.outer",
--     ["im"] = "@function.inner",
--     ["ac"] = "@class.outer",
--     ["ic"] = "@class.inner",
--     ["ab"] = "@block.outer",
--     ["ib"] = "@block.inner",
--     ["al"] = "@loop.outer",
--     ["il"] = "@loop.inner",
--     ["ap"] = "@parameter.outer",
--     ["ip"] = "@parameter.inner",
--     ["as"] = "@statement.outer",
--     ["is"] = "@statement.inner",
--     ["aa"] = "@comment.outer",
--     ["ia"] = "@comment.inner",
--     ["a="] = "@assignment.outer",
--     ["i="] = "@assignment.inner",
--     ["l="] = "@assignment.lhs",
--     ["r="] = "@assignment.rhs",
-- }
-- for lhs, query in pairs(objects) do
--     vim.keymap.set({ "x", "o" }, lhs, function()
--         ts_select.select_textobject(query, "textobjects")
--     end, { desc = query })
-- end


-- TELESCOPE
require('trouble').setup({})
local open_with_trouble = require('trouble.sources.telescope').open
local add_to_trouble = require("trouble.sources.telescope").add
require('telescope').setup({
    defaults = {
        layout_strategy = "vertical",
        mappings = {
            i = {
                ["<C-b>"] = open_with_trouble,
                ["<C-B>"] = add_to_trouble,
            },
            n = {
                ["<C-b>"] = open_with_trouble,
                ["<C-B>"] = add_to_trouble,
            },
        },
        selection_caret = "❯ ",
        sorting_strategy = "descending",
    },
})
require('telescope').load_extension('ui-select')
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope.git_files, {})
vim.keymap.set('n', '<leader><S-f>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fd', telescope.diagnostics, {})
vim.keymap.set('n', '<leader>hi', telescope.oldfiles, {})
vim.keymap.set('n', '<leader>fl', telescope.lsp_references, {})
