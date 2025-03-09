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
