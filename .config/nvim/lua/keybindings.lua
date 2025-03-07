local function map(kind, lhs, rhs, opts)
    vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end
local noremap = { noremap = true }
local silentnoremap = { noremap = true, silent = true }

map('i', 'jj', '<Esc>', silentnoremap)                                              -- JJ -> Esc
map('t', 'jj', '<C-\\><C-n>', silentnoremap)                                        -- JJ -> Esc in Terminal

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
map('n', '<C-k>', ':resize +2<CR>', silentnoremap)                                  -- Pane Up
map('n', '<C-j>', ':resize -2<CR>', silentnoremap)                                  -- Pane Down
map('n', '<C-h>', ':vertical resize +2<CR>', silentnoremap)                         -- Pane Left
map('n', '<C-l>', ':vertical resize -2<CR>', silentnoremap)                         -- Pane Right

map('n', '[t', ':tabnext<CR>', silentnoremap)                                       -- Tab Next
map('n', ']t', ':tabprev<CR>', silentnoremap)                                       -- Tab Prev

map('v', "J", ":m '>+1<CR>gv=gv", {})                                               -- Move Selection Up
map('v', "K", ":m '<-2<CR>gv=gv", {})                                               -- Move Selection Down

map('n', "n", "nzzzv", {})                                                          -- Center Next Search
map('n', "N", "Nzzzv", {})                                                          -- Center Prev Search

map('n', "<leader>y", "\"+y", {})                                                   -- Copy to System Clipboard
map('v', "<leader>y", "\"+y", {})                                                   -- Copy to System Clipboard
map('n', "<leader>Y", "\"+Y", {})                                                   -- Copy to System Clipboard

map('n', 'gr', ":Trouble lsp_references<CR>", {})                                   -- LSP References
map('n', 'gD', ":Trouble diagnostics<CR>", {})                                      -- LSP Diagnostics

map('n', '<leader><S-g>', ':G ', {})                                                -- Git open command

map('n', '<leader>g', ':Gen ', {})                                                  -- Launch Gen LLM
map('n', '<leader><S-a><S-i>', ':Copilot enable<CR>', {})                           -- Copilot Enable
map('n', '<leader>ai', ':Copilot disable<CR>', {})                                  -- Copilot Disable

map('n', '<leader>db' , ':lua require("dap").toggle_breakpoint()<CR>', {})          -- DAP: Toggle Breakpoint
map('n', '<leader>dc' , ':lua require("dap").continue()<CR>', {})                   -- DAP: Continue
map('n', '<leader>dC' , ':lua require("dap").run_to_cursor()<CR>', {})              -- DAP: Run to Cursor
map('n', '<leader>dT' , ':lua require("dap").terminate()<CR>', {})                  -- DAP: Terminate
map('n', '<leader>du' , ':lua require("dapui").toggle()<CR>', {})                   -- DAP: Toggle UI

map('n', '<leader>b', ":Trouble qflist toggle<CR>", {})                             -- Open Quickfix
map('n', '[e', ":cp<CR>", {})                                                       -- Next Error
map('n', ']e', ":cn<CR>", {})                                                       -- Prev Error
