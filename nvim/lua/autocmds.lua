-- make new folders for new saved files
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local dir = vim.fn.expand("%:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- go to last position of files
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local line_count = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})

-- language-specific indentation settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt.tabstop = 3
		vim.opt.shiftwidth = 3
		vim.opt.textwidth = 80
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		vim.opt.textwidth = 100
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		-- Automatically enter Terminal-mode (insert) when opening a terminal
		vim.cmd("startinsert")
		-- disable number lines on terminal buffers
		vim.wo.number = false
		vim.wo.relativenumber = false
		-- enable Ctrl + C in terminal window
		vim.api.nvim_buf_set_keymap(0, "n", "<C-c>", "<C-c>", { noremap = true, silent = true })
		-- set terminal separator line color
		vim.cmd.hi("WinSeparator guifg=#7b7b7c")
	end,
})
-- set terminal buffer colors
vim.cmd("set winhighlight=Normal:MyNormal,NormalNC:MyNormalNC")

-- set custom colors
local function set_background_color(color)
	vim.cmd.hi("Normal guibg=" .. color)
	vim.cmd.hi("LineNr guibg=" .. color)
	vim.cmd.hi("SignColumn guibg=" .. color)
	vim.cmd.hi("VertSplit guibg=" .. color)
end

local function set_misc_text_color(color)
	vim.cmd.hi("LineNr guifg=" .. color)
	vim.cmd.hi("NonText guifg=" .. color)
	vim.cmd.hi("SpecialKey guifg=" .. color)
	vim.cmd.hi("EndOfBuffer guifg=" .. color)
end

local function set_mini_statusline_colors()
	local text_color = "#c3c3c4"
	vim.cmd.hi("MiniStatuslineFilename guibg=#38383b guifg=" .. text_color)
	vim.cmd.hi("MiniStatuslineFileinfo guibg=#4b4b4e guifg=" .. text_color)
	vim.cmd.hi("MiniStatuslineDevinfo guibg=#4b4b4e guifg=" .. text_color)
	vim.cmd.hi("MiniStatuslineModeNormal guibg=#6098d1")
	vim.cmd.hi("MiniStatuslineModeInsert guibg=#66c99d")
	vim.cmd.hi("MiniStatuslineModeVisual guibg=#957bc5")
	vim.cmd.hi("MiniStatuslineModeReplace guibg=#c55e71")
	vim.cmd.hi("MiniStatuslineModeCommand guibg=#d29543")
	vim.cmd.hi("MiniStatuslineModeOther guibg=#149c7c")
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd.hi("Whitespace guifg=#4e4e51")
		vim.cmd.hi("Comment guifg=#7b7b7c")
		vim.cmd.hi("DiagnosticUnnecessary guifg=#7b7b7c")
		vim.cmd.hi("CursorLine guibg=#38383b")
		set_background_color("#232326")
		set_misc_text_color("#919192")
		set_mini_statusline_colors()
	end,
})
