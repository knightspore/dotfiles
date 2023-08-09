local function map(kind, lhs, rhs, opts)
    vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end
local noremap = { noremap = true }
local silentnoremap = { noremap = true, silent = true }

map('i', 'jj', '<Esc>', silentnoremap)                                            -- JJ -> Esc

map('n', '<leader>w', ':Lexplore<CR>', silentnoremap)                             -- Open NetRW

map('n', '<leader>s', ':w<CR>', silentnoremap)                                    -- Save File
map('n', '<leader>q', ':q<CR>', silentnoremap)                                    -- Quit

map('n', '<leader>z', ':set wrap!<CR>', silentnoremap)                            -- Toggle Wrap

map('n', '<leader>h', ':wincmd h<CR>', noremap)                                   -- Pane Left
map('n', '<leader>j', ':wincmd j<CR>', noremap)                                   -- Pane Down
map('n', '<leader>k', ':wincmd k<CR>', noremap)                                   -- Pane Up
map('n', '<leader>l', ':wincmd l<CR>', noremap)                                   -- Pane Right

map('n', '<leader>t', ':tabnext<CR>', silentnoremap)                              -- Tab Next
map('n', '<S-t>', ':tabprevious<CR>', silentnoremap)                              -- Tab Prev

map('v', "J", ":m '>+1<CR>gv=gv", {})                                             -- Move Selection Up
map('v', "K", ":m '<-2<CR>gv=gv", {})                                             -- Move Selection Down

map('n', "n", "nzzzv", {})                                                        -- Center Next Search
map('n', "N", "Nzzzv", {})                                                        -- Center Prev Search

map('n', "<leader>y", "\"+y", {})                                                 -- Copy to System Clipboard
map('v', "<leader>y", "\"+y", {})                                                 -- Copy to System Clipboard
map('n', "<leader>Y", "\"+Y", {})                                                 -- Copy to System Clipboard

map('n', '<leader>%', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {}) -- Replace under cursor
