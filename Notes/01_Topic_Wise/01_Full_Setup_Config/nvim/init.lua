-- First we will require the basic settings that we done inside 'lua/settings.lua'
require("settings")
-- 
require("maps")
require("plugins")

local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
	vim.cmd("colorscheme kanagawa")
else
	return
end
