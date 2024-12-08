return {
  "mattn/emmet-vim",
  ft = { "html", "css", "ejs" }, -- Load only for these file types
  config = function()
    -- Add EJS support
    vim.g.user_emmet_settings = {
      filetype = {
        ejs = { -- Treat .ejs files as HTML
          extends = "html",
        },
      },
    }

    -- Map <Tab> for Emmet expansion in insert mode
    vim.api.nvim_set_keymap('i', '<Tab>', '<Plug>(emmet-expand-abbr)', { noremap = false, silent = true })

    -- Ensure .ejs files are treated correctly by Emmet
    vim.cmd([[
      autocmd BufNewFile,BufRead *.ejs setlocal filetype=ejs
    ]])
  end,
}

