-- vim.o.shell = 'C:\\Program Files\\Git\\bin\\bash.exe' -- default command line
vim.opt.shell ="cmd.exe" -- default terminal

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
