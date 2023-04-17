local status, toggleterm = pcall(require, "toggleterm")

if not status then
	return
end

toggleterm.setup({
	size = 10,
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
})
