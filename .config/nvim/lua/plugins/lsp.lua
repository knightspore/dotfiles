local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }
    vim.keymap.set({ "n", "x" }, "<leader>p", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').phpactor.setup {
    cmd = { "phpactor", "language-server" },
    filetypes = { "php" },
    root_dir = require('lspconfig/util').root_pattern("composer.json", ".git"),
    init_options = {
        ["language_server_worse_reflection.inlay_hints.enable"] = true,
        ["language_server_worse_reflection.inlay_hints.params"] = true,
        ["language_server_worse_reflection.inlay_hints.types"] = true,
        ["language_server_configuration.auto_config"] = false,
        ["code_transform.import_globals"] = true,
        ["language_server_phpstan.enabled"] = true,
        ["language_server_phpstan.bin"] = "phpstan",
    }
}

lsp.setup()

local cmp = require('cmp')
cmp.setup({
    mapping = {
        -- Autocompletion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true })
    }
})

-- Copilot stuff (rebind tab)
vim.g.copilot_assume_mapped = true

-- Etc. Plugins after LSP
require('nvim-ts-autotag').setup({
    filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'twig', 'xml' }
})
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning'
        },
        update_in_insert = false,
    }
)
require("ibl").setup()
