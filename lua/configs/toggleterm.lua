local status, toggleterm = pcall(require, "toggleterm")

if not status then
	return
end

toggleterm.setup({
	size = 50,
	open_mapping = [[<F7>]],
	shading_factor = 2,
	direction = "float",
	close_on_exit = true,
	persist_size = true,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
  -- Changing shell to 'vim.g.terminal_emulator' and this is mendetory if you want to use windows powershell as you terminal
  shell = vim.g.terminal_emulator,
})
