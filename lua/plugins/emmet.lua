return {
  "mattn/emmet-vim",
  ft = { "html", "css", "ejs" }, -- Load only for these file types
  config = function()
    -- Add EJS support by treating .ejs files as HTML
    vim.g.user_emmet_settings = {
      filetype = {
        ejs = { -- Treat .ejs files as HTML
          extends = "html",
        },
      },
    }

    -- Map <Tab> for Emmet expansion in insert mode
    vim.api.nvim_set_keymap('i', '<Tab>', '<Plug>(emmet-expand-abbr)', { noremap = true, silent = true })

    -- Ensure .ejs files are treated correctly by Emmet
    vim.cmd([[
      autocmd FileType ejs setlocal filetype=html
    ]])

    -- Disable Emmet in JavaScript/TypeScript files to avoid conflicts
    vim.cmd([[
      autocmd FileType javascript,typescript,js,ts let g:user_emmet_mode='none'
    ]])
  end,
}

