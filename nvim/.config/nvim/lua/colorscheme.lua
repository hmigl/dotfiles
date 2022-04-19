local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found")
	return
end

-- Use a colorscheme, but make background transparent
vim.cmd('hi Normal guibg=NONE')
