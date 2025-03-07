return require('packer').startup(function(use)
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
end)
