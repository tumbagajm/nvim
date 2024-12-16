return {
  {
    "williamboman/mason.nvim", 
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "tailwindcss"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Define on_attach and capabilities manually
      local on_attach = function(client, bufnr)
        -- Add custom keybindings for LSP-related actions
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)  -- Adjust if you're using a different snippet engine
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'vsnip' },  -- Adjust if you're using a different snippet engine
          { name = 'buffer' },
        },
      })
    end
  },
  {
    "hrsh7th/vim-vsnip",
  }
}

