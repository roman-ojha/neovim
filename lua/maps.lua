local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- map("<mode>", "<key_to_map>", "<command_to_execute>")
-- <mode> = n, v, i, c, t
-- 		n = normal
-- 		v = visual
-- 		i = insert
-- 		c = command
-- 		t = terminal
-- <key_to_map> = the key to map
-- 		<leader> = the space key
-- 		    <leader>ff = <space> + f + f
-- 		<TAB> = the tab key
-- 		<S-TAB> = the shift + tab key
-- 		<C-h> = the control + h key
-- 		<C-l> = the control + l key 
-- 		<Space> = the space key
-- <command_to_execute> = the command to execute

-- Some more key binding examples: https://neovim.discourse.group/t/how-can-i-map-ctrl-shift-f5-ctrl-shift-b-ctrl-and-alt-enter/2133/2

local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	map("n", "<leader>ff", telescope.find_files)
	map("n", "<leader>fg", telescope.live_grep)
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fs", telescope.git_status)
	map("n", "<leader>fc", telescope.git_commits)
else
	print("Telescope not found")
end

-- <leader> = the space key

-- Save
map("n", "<C-s>", "<CMD>update<CR>")

-- Quit
map("n", "<SA-w>", "<CMD>q<CR>")
-- map to close all windows
map("n", "<CA-w>", "<CMD>qall<CR>")
-- close Buffer
map("n", "<SA-w>", "<CMD>Bdelete!<CR>")
-- here is ':bdelete', ':bdelete!', ':Bdelete' test it out by you self

-- Exit insert mode
-- map("i", "jk", "<ESC>")

-- Split Windows
map("n", "<C-\\>", "<CMD>vsplit<CR>")
map("n", "<CS-\\>", "<CMD>split<CR>")

-- NeoTree
map("n", "<SA-b>", "<CMD>Neotree toggle<CR>")
map("n", "<C-0>", "<CMD>Neotree focus<CR>")
-- map to create a new file using NeoTree
map("n", "<SA-n>", "<CMD>enew<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Terminal
map("n", "<CA-b>", "<CMD>ToggleTerm direction=vertical<CR><C-\\><C-n>", { noremap = true })
-- Ctrl + Alt + b
map("n", "<CA-n>", "<CMD>ToggleTerm direction=float<CR><C-\\><C-n>", { noremap = true })
-- map to exit terminal mode
map("t", "<C-[>", "<C-\\><C-n>")
-- map to focus terminal


-- Markdown Preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>ms", "<CMD>MarkdownPreviewStop<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<CA-h>", "<C-w><")
map("n", "<CA-l>", "<C-w>>")
map("n", "<CA-j>", "<C-w>+")
map("n", "<CA-k>", "<C-w>-")