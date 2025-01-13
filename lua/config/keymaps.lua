local builtin = require('telescope.builtin')

-- Telescope keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {})

-- Escape key alternative in insert mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Nvim-tree toggle
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Panel navigation (split windows)
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true }) -- Move to the left panel
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true }) -- Move to the bottom panel
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true }) -- Move to the top panel
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true }) -- Move to the right panel

