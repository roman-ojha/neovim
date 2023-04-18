-- Check if lspconfig is installed or not
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Now requiring lsp manson
require ("config.lsp.mason")
require("config.lsp.handlers").setup()

-- require "user.lsp.null-ls"