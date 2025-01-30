return {
	"Exafunction/codeium.vim",
	config = function()
		-- Enable Codeium globally (optional)
		vim.g.codeium_enabled = true

		-- Keybindings for Codeium
    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.codeium_fallback()", { expr = true, noremap = true, silent = true })

		vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>(codeium-next)", {})
		vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>(codeium-prev)", {})
	end,
}
