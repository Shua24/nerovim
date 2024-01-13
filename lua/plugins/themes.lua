-- This is only for themes that can't be customised.
return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- An example of how to set the theme
		-- config = function()
		--  vim.cmd("colorscheme rose-pine") -- default, override by using themery.
		-- end,
	},

	{ "folke/tokyonight.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	{ "jacoborus/tender.vim" },
	{ "ellisonleao/gruvbox.nvim" },
	{
		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			vim.cmd("colorscheme oxocarbon")
		end,
	},

	{ "savq/melange-nvim" },
}
