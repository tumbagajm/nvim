return {
  "akinsho/flutter-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
  config = function()
    require("flutter-tools").setup({
      lsp = {
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<CR>", opts)
          vim.keymap.set("n", "<leader>fh", "<cmd>FlutterReload<CR>", opts)
          vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<CR>", opts)
        end,
      },
    })
  end,
}

