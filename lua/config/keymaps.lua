local builtin = require("telescope.builtin")

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep String under Cursor" })

vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

-- Escape key alternative in insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Nvim-tree toggle
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Panel navigation (split windows)
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true }) -- Move to the left panel
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true }) -- Move to the bottom panel
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true }) -- Move to the top panel
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true }) -- Move to the right panel

-- UFO - Folding
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zc", "zc", { desc = "Close current fold" })
vim.keymap.set("n", "zo", "zo", { desc = "Open current fold" })
vim.keymap.set("n", "za", "za", { desc = "Toggle current fold" })

-- Move current line up
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move current line down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Indent with Tab in visual mode
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
-- Unindent with Shift+Tab in visual mode
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
-- Indent current line with >
vim.api.nvim_set_keymap("n", ">", ">>", { noremap = true, silent = true })
-- Unindent current line with <
vim.api.nvim_set_keymap("n", "<", "<<", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<CR>",{} )
vim.keymap.set("n", "<leader>fh", "<cmd>FlutterReload<CR>", {})
vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<CR>", {})
