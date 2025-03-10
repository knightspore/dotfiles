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
