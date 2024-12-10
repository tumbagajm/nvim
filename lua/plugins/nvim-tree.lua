return {
    'kyazdani42/nvim-tree.lua',  -- nvim-tree plugin
    dependencies = {
        'nvim-tree/nvim-web-devicons',  -- for file icons
    },
    config = function()
        require'nvim-tree'.setup({
            -- your nvim-tree configuration options
            auto_close = true,  -- automatically close the tree when the last file is closed
            open_on_tab = true,  -- open the tree when opening a tab
            update_focused_file = {
                enable = true,
                update_cwd = true,  -- update cwd as you navigate files
            },
            view = {
                width = 30,  -- set the width of the tree
                side = 'left',  -- set the side where the tree will open
            },
        })
    end
}

