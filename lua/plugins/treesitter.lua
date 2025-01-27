return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript" },
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				fold = { enable = true },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
