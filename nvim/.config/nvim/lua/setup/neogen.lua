local status_ok, neogen = pcall(require, 'neogen')
if not status_ok then
  return
end

neogen.setup({
  snippet_engine = 'luasnip',
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>dg', neogen.generate, { desc = '[G]enarate [D]ocumentation' }, opts)
