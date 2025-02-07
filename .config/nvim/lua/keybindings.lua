local function map(kind, lhs, rhs, opts)
    vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end
local noremap = { noremap = true }
local silentnoremap = { noremap = true, silent = true }

map('i', 'jj', '<Esc>', silentnoremap)                                              -- JJ -> Esc

map('n', '<leader>w', ':NERDTreeToggle<CR>', silentnoremap)                         -- Open NERDTree
map('n', '<leader><S-w>', ':NERDTreeFind<CR>', silentnoremap)                       -- Open NERDTree on current file

map('n', '<leader>s', ':w<CR>', silentnoremap)                                      -- Save File
map('n', '<leader>q', ':q<CR>', silentnoremap)                                      -- Quit

map('n', '<leader>z', ':set wrap!<CR>', silentnoremap)                              -- Toggle Wrap

map('n', '<leader>h', ':wincmd h<CR>', noremap)                                     -- Pane Left
map('n', '<leader>j', ':wincmd j<CR>', noremap)                                     -- Pane Down
map('n', '<leader>k', ':wincmd k<CR>', noremap)                                     -- Pane Up
map('n', '<leader>l', ':wincmd l<CR>', noremap)                                     -- Pane Right

map('n', '<C-Up>', ':resize +2<CR>', silentnoremap)                                 -- Pane Up
map('n', '<C-Down>', ':resize -2<CR>', silentnoremap)                               -- Pane Down
map('n', '<C-Left>', ':vertical resize +2<CR>', silentnoremap)                      -- Pane Left
map('n', '<C-Right>', ':vertical resize -2<CR>', silentnoremap)                     -- Pane Right

map('n', '<leader>t', ':tabnext<CR>', silentnoremap)                                -- Tab Next
map('n', '<S-t>', ':tabPrevious<CR>', silentnoremap)                                -- Tab Prev

map('v', "J", ":m '>+1<CR>gv=gv", {})                                               -- Move Selection Up
map('v', "K", ":m '<-2<CR>gv=gv", {})                                               -- Move Selection Down

map('n', "n", "nzzzv", {})                                                          -- Center Next Search
map('n', "N", "Nzzzv", {})                                                          -- Center Prev Search

map('n', "<leader>y", "\"+y", {})                                                   -- Copy to System Clipboard
map('v', "<leader>y", "\"+y", {})                                                   -- Copy to System Clipboard
map('n', "<leader>Y", "\"+Y", {})                                                   -- Copy to System Clipboard

map('n', '<leader>%', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})   -- Replace under cursor

map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>', {})            -- Harpoon: Add File
map('n', '<leader><S-m>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {}) -- Harpoon: File Navigation
map('n', '<leader>n', ':lua require("harpoon.ui").nav_next()<CR>', {})              -- Next Harpoon
map('n', '<leader><S-n>', ':lua require("harpoon.ui").nav_prev()<CR>', {})          -- Prev Harpoon

map('n', '<leader><S-g>', ':set hlsearch<CR>', {})                                  -- Highlight searches
map('n', '<leader><S-h>', ':set nohlsearch<CR>', {})                                -- No search highlighting

map('n', '<leader><S-g>', ':G ', {})                                                -- Git open command

map('n', '<leader>g', ':Gen ', {})                                                  -- Git open command

map('n', '<leader><S-a><S-i>', ':Copilot enable<CR>', {})                           -- Copilot Enable
map('n', '<leader>ai', ':Copilot disable<CR>', {})                                  -- Copilot Disable
