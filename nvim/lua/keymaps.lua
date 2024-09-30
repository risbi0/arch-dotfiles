function replace_string()
	local old_var = vim.fn.input("Pattern (regex-sensitive): ")

	if old_var == "" then
		vim.cmd("redraw")
		vim.api.nvim_echo({ { "Pattern string cannot be empty", "ErrorMsg" } }, true, {})
		return
	end

	local new_var = vim.fn.input("Replacement: ")

	if new_var == "" then
		vim.cmd("redraw")
		vim.api.nvim_echo({ { "Replacement string cannot be empty", "ErrorMsg" } }, true, {})
		return
	end

	local count = vim.fn.searchcount({ pattern = old_var, maxcount = 0 }).total

	if count == 0 then
		vim.cmd("redraw")
		vim.api.nvim_echo({ { "Pattern not found: " .. old_var, "ErrorMsg" } }, true, {})
	else
		vim.cmd(string.format("%%s/%s/%s/gc", old_var, new_var))
	end
end

vim.keymap.set("n", "<leader>r", ":lua replace_string()<CR>", { desc = "Replace string" })
vim.keymap.set("n", "yp", "yyp", { desc = "Duplicate string" })
vim.keymap.set("n", "mk", ":m-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("n", "mj", ":m+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<leader>av", "ggVG", { desc = "Select all text" })
vim.keymap.set("n", "<leader>ac", "ggVGy", { desc = "Copy all text" })
vim.keymap.set("n", "<leader>ax", "ggVGd", { desc = "Cut all text" })
