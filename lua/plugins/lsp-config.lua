return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"jdtls",
				"ts_ls",
				"ruby_lsp",
        "gopls",
			},
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

      lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
					},
				},
			})

			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				cmd = { "jdtls" }, -- Path to the Java language server executable
				root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle"),
			})
			lspconfig.dartls.setup({
				on_attach = function(client, bufnr)
					local opts = { noremap = true, silent = true, buffer = bufnr }
					-- Auto-import keybinding
					vim.keymap.set("n", "<leader>i", vim.lsp.buf.code_action, opts)
				end,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<A-Enter>", vim.lsp.buf.code_action, { desc = "Code Action (Auto-import)" })
			vim.keymap.set("n", "<A-Insert>", function()
				require("jdtls").code_action() -- Trigger the jdtls code action menu
			end, { desc = "Generate Code (Getters/Setters)" })

      vim.diagnostic.config({
				update_in_insert = true,
				virtual_text = {
					prefix = "●",
				},
				signs = true,
				underline = true,
			})
		end,
	},
}
