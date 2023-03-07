vim.opt.hidden = true          -- Required to keep multiple buffers open

vim.opt.nu = true              -- Show line numbers
vim.opt.rnu = true             -- Show line relative numbers

vim.opt.cb = 'unnamedplus'     -- Copy/paste between vim and everything else

vim.opt.hlsearch = false       -- Disable hlsearch
vim.opt.incsearch = true       -- Show searches incrementally

vim.opt.icm = 'nosplit'        -- Show substitutions incrementally

vim.opt.ic = true              -- Ignore case in search patterns
vim.opt.scs = true             -- Override the 'ic' option if the search pattern contains upper case characters

vim.opt.tgc = true             -- Use more colors

vim.opt.scrolloff = 8          -- Start scrolling with 8 lines
vim.opt.signcolumn = 'yes'     -- Draw an extra column
vim.opt.cursorline = true      -- Draw an extra column

vim.opt.swapfile = false       -- Don't use a 'swapfile'

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. '/.local/share/nvim/undodir'

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd( { 'BufRead', 'BufNewFile'}, {
  pattern = '*.h',
  command = 'setfiletype c',
})
