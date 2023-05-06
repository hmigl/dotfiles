local colorscheme = 'rose-pine'
-- local colorscheme = 'duskfox'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
    vim.notify('colorsheme ' .. colorscheme .. 'not found')
    return
end

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
