return {
  'lewis6991/gitsigns.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup {
      current_line_blame = true, -- show git blame inline
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = 'eol'
      }
    }
  end,
}

