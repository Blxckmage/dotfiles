-- Don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", {
	command = [[set formatoptions-=cro]],
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Auto create dir when saving a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Hijack netrw wit Snacks explorer
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	group = vim.api.nvim_create_augroup("SnacksExplorerInit", { clear = true }),
-- 	callback = function()
-- 		local f = vim.fn.expand("%:p")
-- 		if vim.fn.isdirectory(f) ~= 0 then
-- 			vim.cmd("silent lua Snacks.explorer({ cwd = vim.fn.fnamemodify(f, ':p:h') })")
-- 			vim.api.nvim_clear_autocmds({ group = "SnacksExplorerInit" })
-- 		end
-- 	end,
-- })

-- Transparent NormalFloat background
local function set_normal_float_highlight()
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = set_normal_float_highlight,
})
