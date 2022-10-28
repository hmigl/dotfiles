-- :help options
local opt = vim.opt               -- to set options
-- opt.syntax = "enable"
opt.hidden = true                 -- required to keep multiple buffers open
opt.number = true                 -- show line numbers
opt.relativenumber = true         -- show line relative numbers
opt.mouse = "a"                   -- enable mouse
opt.clipboard = "unnamedplus"     -- copy paste between vim and everything else
opt.splitright = true             -- put new windows right of current
opt.splitbelow = true             -- put new windows below current
opt.smartindent = true            -- insert indents automatically
opt.autoindent = true             -- auto indent new lines
opt.hlsearch = false              -- disable hlsearch
opt.inccommand = "nosplit"        -- show substitutions incrementally
opt.ignorecase = true             -- ignore case
opt.smartcase = true              -- when seaching try to be smart about cases
opt.termguicolors = true          -- use more colors
opt.scrolloff = 5                 -- start scrolling with 5 lines
opt.signcolumn = "yes"            -- draw an extra column
opt.wildmode = "longest,list,full" -- better autocompletion
opt.path:append("**/*")           -- add all subdirectories
opt.swapfile = false              -- don't use a swapfile
opt.cursorline = true             -- highlight the current line

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
