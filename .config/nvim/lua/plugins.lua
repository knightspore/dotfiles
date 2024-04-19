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
    use 'norcalli/nvim-colorizer.lua'
    use 'ryanoasis/vim-devicons'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Utilities
    use 'junegunn/fzf'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
    use 'jiangmiao/auto-pairs'
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
    use 'windwp/nvim-ts-autotag'
    use { 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} }
    use 'adalessa/laravel.nvim'
    use 'fatih/vim-go'
    use 'gbprod/php-enhanced-treesitter.nvim'
end)
