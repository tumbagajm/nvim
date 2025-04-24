return {
  'Exafunction/windsurf.vim',
  event = 'BufEnter',
  config = function()
    vim.keymap.set('n', '<leader>ws', function() require('windsurf').save_layout() end, { desc = "Save window layout" })
    vim.keymap.set('n', '<leader>wl', function() require('windsurf').load_layout() end, { desc = "Load window layout" })
  end
}
