local icons = require("nvim-nonicons")
icons.setup({})
require('telescope').setup({
    defaults = {
        prompt_prefix = "  " .. icons.get("telescope") .. "  ",
        selection_caret = "❯ ",
        entry_prefix = "  ",
        sorting_strategy = "descending",
    },
})
require('telescope').load_extension('ui-select')
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope.git_files, {})
vim.keymap.set('n', '<leader><S-f>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
