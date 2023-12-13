local harpoon = require('harpoon')

harpoon.setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<A-u>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-i>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-o>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-p>", function() harpoon:list():select(4) end)
