-- Initializing The color scheme/theme

-- Sometimes you will get an error if you didn't found the colorscheme so for that we have to check if the colorscheme is installed or not and then set it

-- firstly we will set the default colorscheme that exist
local colorscheme = "kanagawa"

-- then we will check if the colorscheme is installed or not
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- here we are doing a protected call then we will call vim.cmd to set the colorscheme
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
