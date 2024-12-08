-- lualine.lua (Plugin configuration file)
return {
  -- Lualine plugin declaration
  'nvim-lualine/lualine.nvim',

  -- Dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  -- Configuring the lualine plugin after installation
  config = function()
    -- Setup lualine with custom configurations
    require('lualine').setup({
      options = {
        theme = 'gruvbox',  -- Choose your desired theme
        section_separators = { '', '' },  -- Angled separators for sections (left and right)
        component_separators = { '', '' },  -- Angled separators for components (middle separators)
      },
      sections = {
        -- Left section
        lualine_a = {'mode'},
        -- Middle section
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},  -- Show filename in the center
        -- Right section
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      extensions = {'fugitive'}  -- Optional: adds Git integration through fugitive
    })
  end,
}

