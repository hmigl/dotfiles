-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local builtin = require('telescope.builtin')
local action_layout = require('telescope.actions.layout')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<M-p>"] = action_layout.toggle_preview,
      },
      n = {
        ["<M-p>"] = action_layout.toggle_preview
      },
    },
  },
  extensions = {
  },
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind [G]it files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fa', function()
  builtin.grep_string({ search = vim.fn.input("Grep> ") });
end, { desc = '[F]ind [A]ny word' })
