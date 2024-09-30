-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Ensure termguicolors is enabled if not already
return {
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			vim.opt.termguicolors = true
			require("nvim-highlight-colors").setup({})
		end,
	},
	{ "rafamadriz/friendly-snippets" },
}
