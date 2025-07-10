return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript" },
        ensure_installed = {
          "php",        -- Laravel backend
          "blade",      -- Blade templates
          "html",       -- HTML structure
          "css",        -- CSS for jQuery/React
          "javascript", -- jQuery
          "tsx",        -- React (JSX/TSX)
          "lua",        -- For Neovim config
          "json",       -- Often used with APIs/configs
        },
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
