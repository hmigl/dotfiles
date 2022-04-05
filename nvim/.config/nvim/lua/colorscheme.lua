-- vim.cmd "colorscheme default"

vim.g.tokyonight_style = "night"
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found")
	return
end

-- use a colorscheme, but make background transparent:
vim.cmd [[

hi Normal guibg=NONE ctermbg=NONE

]]
