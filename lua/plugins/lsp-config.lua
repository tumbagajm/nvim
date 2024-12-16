return {
  {
    "williamboman/mason.nvim", 
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lsconfig.nvim",
    config = function()
      require("mason-lsconfig").setup({
        ensure_installed = { "lua_ls" }
      })
    end
  }
}

