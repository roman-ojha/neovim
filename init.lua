-- vim.opt.shell = 'pwsh.exe'
-- vim.g.terminal_emulator='powershell'
-- vim.api.nvim_set_var('terminal_emulator', 'powershell')
vim.o.shell = 'cmd.exe'
vim.g.terminal_color_5 = 'blue'
-- V1
require("settings")
require("maps")
require("plugins")

local themeStatus, kanagawa = pcall(require, "kanagawa")
--  = 'C:\Program Files\PowerShell\7\pwsh.exe'

if themeStatus then
	vim.cmd("colorscheme kanagawa")
else
	return
end
