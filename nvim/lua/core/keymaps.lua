local function map(mode, lhs, rhs, opt)
	if not opt or type(opt) == "string" then
		opt = { silent = true, desc = opt }
	end
	vim.keymap.set(mode, lhs, rhs, opt)
end

-- New Tab
map("n", "te", ":tabedit<Return>")
map("n", "ss", ":split<Return><C-w>w")
map("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
map("n", "<Space>", "<C-w>w")
map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Nvim-tree
map("n", "<Leader>-", "<cmd>NvimTreeToggle<CR>")

-- Move text up and down
map("v", "<S-j>", ":m '>+1<cr>gv=gv")
map("v", "<S-k>", ":m '<-2<cr>gv=gv")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
