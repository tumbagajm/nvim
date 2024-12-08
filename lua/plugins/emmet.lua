-- emmet.lua

return {
  "mattn/emmet-vim",  -- Emmet plugin

  -- Configuring Emmet plugin
  config = function()
    -- Mapping <Tab> to expand Emmet abbreviation
    vim.api.nvim_set_keymap('i', '<Tab>', '<Plug>(emmet-expand-abbr)', { noremap = false, silent = true })
  end,
}

