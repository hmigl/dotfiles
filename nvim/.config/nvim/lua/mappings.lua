local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal mode -> "n"
--   insert mode -> "i"
--   visual mode -> "v"
--   visual block mode -> "x"

-- Set space as leader key
keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Explore file tree with nvim-tree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })

-- Navigation
  -- Splits
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
  -- Buffers
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<S-l>', ':bnext<CR>', opts)
  -- Tabs
keymap('n', '<A-Left>', ':tabprevious<CR>', opts)
keymap('n', '<A-Right>', ':tabnext<CR>', opts)

-- Resize splits
keymap('n', '<C-Left>', ':vertical resize +2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)

-- Saving/quitting
keymap('n', '<C-s>', ':w<CR>', opts)
keymap('n', '<C-q>', ':q<CR>', opts)

-- Indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
-- Same, but in visual mode
keymap('v', '<A-j>', ':m \'>+1<CR>==gv=gv', opts)
keymap('v', '<A-k>', ':m \'<-2<CR>==gv=gv', opts)

-- Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)

-- Spell check
keymap('n', '<F3>', ':setlocal spell! spelllang=en_us<CR>', opts)
keymap('n', '<F4>', ':set spelllang=pt_br<CR>', opts)
