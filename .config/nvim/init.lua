-- GLOBAL OPTIONS
vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.numberwidth = 1
vim.opt.wrap = false
vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.undolevels = 5000
vim.opt.scrolloff = 8
vim.opt.incsearch = true
vim.opt.updatetime = 200
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.optlist = true
vim.opt.listchars = { tab = "»·", trail = "-", space = "·", eol = "$" }

-- PLUGINS
require('packer').startup(function(use)
    -- Base
    use 'wbthomason/packer.nvim'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim',          opts = { ensure_installed = { "gopls" } } },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Visual
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'bling/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'brenoprata10/nvim-highlight-colors'
    use 'kyazdani42/nvim-web-devicons'
    use 'yamatsum/nvim-nonicons'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Utilities
    use 'junegunn/fzf'
    use "nvim-lua/plenary.nvim"
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.2' }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "nvim-treesitter/nvim-treesitter-context"
    use 'preservim/nerdtree'
    use 'tpope/vim-fugitive'
    use 'github/copilot.vim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
    use 'akinsho/git-conflict.nvim'
    use 'David-Kunz/gen.nvim'
    use {
        'fei6409/log-highlight.nvim',
        config = function()
            require('log-highlight').setup {
                extension = "log"
            }
        end,
    }
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
        end
    }
    use 'tikhomirov/vim-glsl'
    use 'jremmen/vim-ripgrep'
    -- Debug Adapter Protocol
    use "mfussenegger/nvim-dap"
    use { 'jay-babu/mason-nvim-dap.nvim', opts = {
        handlers = {},
        automatic_installation = { exclude = { "delve" } },
        ensure_installed = { "bash", "codelldb", "php", "python", "node", "typescript" },
        requires = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" }
    } }
    use { 'theHamsta/nvim-dap-virtual-text', requires = { 'mfussenegger/nvim-dap' } }
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "jay-babu/mason-nvim-dap.nvim",
            "leoluz/nvim-dap-go",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
    }
    use "folke/which-key.nvim"
    use "tpope/vim-surround"
end)

-- GEN
require('gen').setup({
    model = "deepseek-r1:8b",
    display_mode = "split",
    show_model = true,
    show_prompt = true,
    no_auto_close = true,
})

-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }
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
                    vim.cmd("!php-cs-fixer fix --config=" .. config .. " " .. filepath)
                end
            end,
            json = function()
                vim.cmd("!jq . " .. filepath .. " > " .. filepath)
            end,
        }

        if commands[ft] then
            commands[ft]()
        else
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end
    end, opts)
end)

lsp_zero.set_sign_icons({
    error = ' ✘',
    warn = ' ⚠',
    hint = ' ⚑',
    info = ' »'
})

require('lspconfig').lua_ls.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

require('lspconfig').phpactor.setup {
    cmd = { "phpactor", "language-server" },
    filetypes = { "php" },
    root_dir = require('lspconfig/util').root_pattern("composer.json", ".git"),
    init_options = {
        ["language_server_worse_reflection.inlay_hints.enable"] = true,
        ["language_server_worse_reflection.inlay_hints.types"] = true,
        ["language_server_configuration.auto_config"] = false,
        ["code_transform.import_globals"] = true,
        ["language_server_php_cs_fixer.enabled"] = true,
        ["language_server_php_cs_fixer.bin"] = "/opt/homebrew/bin/php-cs-fixer",
        ["language_server_php_cs_fixer.config"] = os.getenv("HOME") .. "/Developer/stack/utilities/php-cs-fixer/.php-cs-fixer.dist.php",
        ["symfony.enabled"] = true,
    }
}

require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

lsp_zero.setup()

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Autocompletion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    formatting = lsp_zero.cmp_format({ details = true }),
})

-- Copilot stuff (rebind tab)
vim.g.copilot_assume_mapped = true

vim.diagnostic.config({
    underline = true,
    virtual_text = false, -- Disable virtual text
    update_in_insert = false,
    severity_sort = true,
    float = {
        show_header = true,
        border = "single",
    }
})

-- Show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd({ "CursorHold" }, {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})

-- DAP
local dap = require('dap');

dap.adapters.gdb = {
        id = 'gdb',
        type = 'executable',
        command = 'gdb',
        args = { "--interpreter=dap", "--quiet"}
}

dap.configurations.c = {
        {
                name = "Run executable (GDB)",
                type = "gdb",
                request = "launch",
                program = function()
                        local path = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        return (path and path ~= '') and path or dap.ABORT
                end,
        },
        {
                name = 'Run executable with arguments (GDB)',
                type = 'gdb',
                request = 'launch',
                -- This requires special handling of 'run_last', see
                -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
                program = function()
                        local path = vim.fn.input({
                                prompt = 'Path to executable: ',
                                default = vim.fn.getcwd() .. '/',
                                completion = 'file',
                        })

                        return (path and path ~= '') and path or dap.ABORT
                end,
                args = function()
                        local args_str = vim.fn.input({
                                prompt = 'Arguments: ',
                        })
                        return vim.split(args_str, ' +')
                end,
        },
        {
                name = 'Attach to process (GDB)',
                type = 'gdb',
                request = 'attach',
                processId = require('dap.utils').pick_process,
        }
}

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/Users/c/Developer/tools/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
    }
}

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescript = { -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

require("nvim-dap-virtual-text").setup()

require("mason-nvim-dap").setup()

require("dapui").setup({
    library = { "nvim-dap-ui" },
})


-- TREESITTER
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "comment",
        "css",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "lua",
        "markdown",
        "php",
        "rust",
        "sql",
        "twig",
        "typescript",
        "vim",
        "vimdoc",
        "yaml"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "php" },
    },
    indent = {
        enable = true,
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

-- TELESCOPE
local icons = require("nvim-nonicons")
icons.setup({})
local open_with_trouble = require('trouble.sources.telescope').open
local add_to_trouble = require("trouble.sources.telescope").add
require('telescope').setup({
    defaults = {
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
        -- prompt_prefix = "  " .. icons.get("telescope") .. "  ",
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

-- CATPPUCCIN
require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    styles = {
        comments = { "italic" },
    },
    integrations = {
        cmp = true,
        fzf = true,
        gitsigns = true,
        harpoon = true,
        markdown = true,
        mason = true,
        notify = true,
        treesitter = true,
        lsp_trouble = true,
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

-- KEYBINDINGS
local function map(kind, lhs, rhs, opts)
    vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end
local noremap = { noremap = true }
local silentnoremap = { noremap = true, silent = true }

map('i', 'jj', '<Esc>', silentnoremap)                                     -- JJ -> Esc
map('t', 'jj', '<C-\\><C-n>', silentnoremap)                               -- JJ -> Esc in Terminal

map('n', '<leader>w', ':NERDTreeToggle<CR>', silentnoremap)                -- Open NERDTree
map('n', '<leader><S-w>', ':NERDTreeFind<CR>', silentnoremap)              -- Open NERDTree on current file

map('n', '<leader>s', ':w<CR>', silentnoremap)                             -- Save File
map('n', '<leader>q', ':q<CR>', silentnoremap)                             -- Quit
map('n', '<leader>z', ':set wrap!<CR>', silentnoremap)                     -- Toggle Wrap

map('n', '<leader>h', ':wincmd h<CR>', noremap)                            -- Pane Left
map('n', '<leader>j', ':wincmd j<CR>', noremap)                            -- Pane Down
map('n', '<leader>k', ':wincmd k<CR>', noremap)                            -- Pane Up
map('n', '<leader>l', ':wincmd l<CR>', noremap)                            -- Pane Right

map('n', '<C-Up>', ':resize +2<CR>', silentnoremap)                        -- Pane Up
map('n', '<C-Down>', ':resize -2<CR>', silentnoremap)                      -- Pane Down
map('n', '<C-Left>', ':vertical resize +2<CR>', silentnoremap)             -- Pane Left
map('n', '<C-Right>', ':vertical resize -2<CR>', silentnoremap)            -- Pane Right
map('n', '<C-k>', ':resize +2<CR>', silentnoremap)                         -- Pane Up
map('n', '<C-j>', ':resize -2<CR>', silentnoremap)                         -- Pane Down
map('n', '<C-h>', ':vertical resize +2<CR>', silentnoremap)                -- Pane Left
map('n', '<C-l>', ':vertical resize -2<CR>', silentnoremap)                -- Pane Right

map('n', ']t', ':tabnext<CR>', silentnoremap)                              -- Tab Next
map('n', '[t', ':tabprev<CR>', silentnoremap)                              -- Tab Prev

map('v', "J", ":m '>+1<CR>gv=gv", {})                                      -- Move Selection Up
map('v', "K", ":m '<-2<CR>gv=gv", {})                                      -- Move Selection Down

map('n', "n", "nzzzv", {})                                                 -- Center Next Search
map('n', "N", "Nzzzv", {})                                                 -- Center Prev Search

map('n', "<leader>y", "\"+y", {})                                          -- Copy to System Clipboard
map('v', "<leader>y", "\"+y", {})                                          -- Copy to System Clipboard
map('n', "<leader>Y", "\"+Y", {})                                          -- Copy to System Clipboard

map('n', 'gr', ":Trouble lsp_references<CR>", {})                          -- LSP References
map('n', 'gd', ":Trouble lsp_definitions<CR>", {})                         -- LSP Definitions
map('n', 'gD', ":Trouble diagnostics<CR>", {})                             -- LSP Diagnostics
map('n', '<leader>t', ":Trouble ", {})                                     -- Trouble open command

map('n', '<leader><S-g>', ':G ', {})                                       -- Git open command

map('n', '<leader>g', ':Gen ', {})                                         -- Launch Gen LLM
map('n', '<leader><S-a><S-i>', ':Copilot enable<CR>', {})                  -- Copilot Enable
map('n', '<leader>ai', ':Copilot disable<CR>', {})                         -- Copilot Disable

map('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>', {})  -- DAP: Toggle Breakpoint
map('n', '<leader>dc', ':lua require("dap").continue()<CR>', {})           -- DAP: Continue
map('n', '<leader>dC', ':lua require("dap").run_to_cursor()<CR>', {})      -- DAP: Run to Cursor
map('n', '<leader>dT', ':lua require("dap").terminate()<CR>', {})          -- DAP: Terminate
map('n', '<leader>du', ':lua require("dapui").toggle()<CR>', {})           -- DAP: Toggle UI

map('n', '<leader>b', ":Trouble qflist toggle<CR>", {})                    -- Open Quickfix
map('n', '[e', ":cp<CR>", {})                                              -- Next Error
map('n', ']e', ":cn<CR>", {})                                              -- Prev Error
