local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap

-- Modes
--  normal mode -> "n"
--  insert mode -> "i"
--  visual mode -> "v"
--  visual block mode -> "x"

-- Set leader key
-- vim.g.mapleader = '\\' (backslash is used by default)

-- Shortcutting...

-- split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- buffer navigation
map('n', '<leader>h', ':bprevious<CR>', opts)
map('n', '<leader>l', ':bnext<CR>', opts)
-- tab navigation
map('n', '<A-h>', ':tabprevious<CR>', opts)
map('n', '<A-l>', ':tabnext<CR>', opts)

-- Resize splits
map('n', '<C-Left>', ':vertical resize +2<CR>', opts)
map('n', '<C-Right>', ':vertical resize -2<CR>', opts)
map('n', '<C-Up>', ':resize +2<CR>', opts)
map('n', '<C-Down>', ':resize -2<CR>', opts)

-- Saving/quitting
map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-q>', ':q<CR>', opts)

-- Move text...

-- in normal mode
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)
-- in visual mode
map('v', '<A-j>', ':m \'>+1<CR>==gv=gv', opts)
map('v', '<A-k>', ':m \'<-2<CR>==gv=gv', opts)

-- Built-in spell check
map('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', opts)
map('n', '<leader>p', ':set spelllang=pt_br<CR>', opts)

-- Check file in shellcheck
map('n', '<leader>s', ':!clear && shellcheck %<CR>', opts)

-- Plugin mappings...

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
-- NvimTree
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
