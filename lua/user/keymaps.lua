local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local function map(mode, lhs, rhs, options)
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Setting up a mapleader and maplocalleader as space key
local global = vim.g
-- Map <leader> = the space key
global.mapleader = " "
global.maplocalleader = " "

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
--      <CMD>update<CR> = :update<CR>
--      <CMD>q<CR> = :q<CR>
--      <CMD> = :
--      <CR> = press <Enter>
--      gv = visual mode

-- Some more key binding examples: https://neovim.discourse.group/t/how-can-i-map-ctrl-shift-f5-ctrl-shift-b-ctrl-and-alt-enter/2133/2

local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	map("n", "<leader>ff", telescope.find_files, opts)
	map("n", "<leader>fg", telescope.live_grep, opts)
	map("n", "<leader>fb", telescope.buffers, opts)
	map("n", "<leader>fh", telescope.help_tags, opts)
	map("n", "<leader>fs", telescope.git_status, opts)
	map("n", "<leader>fc", telescope.git_commits, opts)
else
	print("Telescope not found")
end

-- Packer plugin popup window
map("n","<leader>pp","<CMD>PackerStatus<CR>",opts)

-- <leader> = the space key

-- Save
map("n", "<C-s>", "<CMD>update<CR>", opts)

-- Quit
map("n", "<SA-w>", "<CMD>q<CR>", opts)
-- map to close all windows
map("n", "<CA-w>", "<CMD>qall<CR>", opts)
-- close Buffer
map("n", "<SA-w>", "<CMD>Bdelete!<CR>", opts)
-- here is ':bdelete', ':bdelete!', ':Bdelete' test it out by you self

-- Exit insert mode
-- map("i", "jk", "<ESC>")

-- Split Windows
map("n", "<C-\\>", "<CMD>vsplit<CR>", opts)
map("n", "<CS-\\>", "<CMD>split<CR>", opts)

-- NeoTree
map("n", "<SA-b>", "<CMD>Neotree toggle<CR>", opts)
map("n", "<C-0>", "<CMD>Neotree focus<CR>", opts)
-- map to create a new file using NeoTree
map("n", "<SA-n>", "<CMD>enew<CR>", opts)

-- Buffer Navigation
map("n", "<TAB>", ":bnext<CR>", opts)
map("n", "<S-TAB>", "<CMD>bprevious<CR>", opts)

-- Terminal
map("n", "<CA-b>", "<CMD>ToggleTerm direction=vertical<CR>", term_opts)
-- Ctrl + Alt + b
map("n", "<CA-n>", "<CMD>ToggleTerm direction=float<CR>", term_opts)
map("t", "<CA-b>", "<CMD>ToggleTerm direction=vertical<CR><ESC>", term_opts)
map("t", "<CA-n>", "<CMD>ToggleTerm direction=float<CR><ESC>", term_opts)
-- map to exit terminal mode
map("t", "<C-[>", "<C-\\><C-n>", term_opts)
-- map to focus from terminal to normal mode and transfer the cursor to buffers
map("t","<C-j>", "<C-\\><C-n><C-w>h", term_opts)
-- open powershell as buffer
map("n", "<SA-t>", "<CMD>terminal pwsh.exe<CR>", term_opts)


-- Markdown Preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>", opts)
map("n", "<leader>ms", "<CMD>MarkdownPreviewStop<CR>", opts)

-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-j>", "<C-w>j", opts)

-- Resize Windows
-- map("n", "<CA-l>", "<C-w>>", opts)
-- map("n", "<CA-h>", "<C-w><", opts)
-- map("n", "<CA-k>", "<C-w>-", opts)
-- map("n", "<CA-j>", "<C-w>+", opts)
map("n", "<CA-l>", ":vertical resize +2<CR>", opts)
map("n", "<CA-h>", ":vertical resize -2<CR>", opts)
map("n", "<CA-k>", ":resize -2<CR>", opts)
map("n", "<CA-j>", ":resize +2<CR>", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", opts)
map("n", "<A-Down>", ":m .+1<CR>==", opts)
map("n", "<A-Up>", ":m .-2<CR>==", opts)
-- hold on to the copied value and paste it
map("v", "p", '"_dP', opts)

-- Stay in indent mode while tabbing lines in visual mod
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- delete word like ctrl + backspace
map("n", "<BS>","diw", opts)
