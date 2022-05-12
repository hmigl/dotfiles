local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.keymap.set

-- Set leader key
-- vim.g.mapleader = '\\' (backslash is used by default)

-- Modes
--  normal mode -> "n"
--  insert mode -> "i"
--  visual mode -> "v"
--  visual block mode -> "x"
--  term mode -> "t"
--  command mode -> "c"

-- Split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Buffer navigation
map('n', '<leader>h', ':bprevious<CR>', opts)
map('n', '<leader>l', ':bnext<CR>', opts)

-- Tab navigation
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

-- ...in normal mode
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)
-- ...in visual mode
map('v', '<A-j>', ':m \'>+1<CR>==gv=gv', opts)
map('v', '<A-k>', ':m \'<-2<CR>==gv=gv', opts)

-- Check file in shellcheck
map('n', '<leader>s', ':!clear && shellcheck %<CR>', opts)

-- Plugin

-- Telescope
map('n', '<leader>ff', '<cmd>lua require\'telescope.builtin\'.find_files()<CR>', opts)
map('n', '<leader>fg', '<cmd>lua require\'telescope.builtin\'.live_grep()<CR>', opts)
map('n', '<leader>fs', '<cmd>lua require\'telescope.builtin\'.grep_string({ search = vim.fn.input("Grep For > ")})<CR>', opts)
map('n', '<leader>fb', '<cmd>lua require\'telescope.builtin\'.buffers()<CR>', opts)
