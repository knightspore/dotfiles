return require('packer').startup(function(use)
    -- Base
    use 'wbthomason/packer.nvim'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                opts = {
                    ensure_installed = { "gopls" }
                }
            },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
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
    use 'ThePrimeagen/harpoon'
    use 'preservim/nerdtree'
    use 'tpope/vim-fugitive'
    use 'github/copilot.vim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'fatih/vim-go'
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
end)
