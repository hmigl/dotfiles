vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { silent = true })

vim.keymap.set("n", ",sv", "<C-w>v<C-w>l")
vim.keymap.set("n", ",sh", "<C-w>s<C-w>j")
vim.keymap.set("n", ",se", "<C-w>=")

vim.keymap.set("v", "<A-j>", ":m \'>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m \'<-2<CR>gv=gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", ",rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
