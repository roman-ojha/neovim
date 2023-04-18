-- vim.opt.shell ="cmd.exe" -- this can't open powershell another other terminals
vim.g.terminal_emulator='pwsh'

-- to require './lua' folder files we don't have to write the full path, it is by default in the runtimepath
require("settings")
require("maps")
require("plugins")

local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
	vim.cmd("colorscheme kanagawa")
else
	return
end
