
-- Set leader key
vim.g.mapleader = " "          -- Leader key set to ','

-- Define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true 	-- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Resize window
-- delta: 2 lines
vim.keymap.set('n', '<C-k>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-j>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-l>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-h>', ':vertical resize +2<CR>', opts)

-- FzfLua
vim.keymap.set('n', '<C-g>', ':FzfLua live_grep<CR>', opts)	-- search live text in current working directory
vim.keymap.set('n', '<C-p>', ':FzfLua files<CR>', opts)	-- search files in current working directory

-- Neotree
vim.keymap.set('n', '<Leader>e', ':Neotree toggle<CR>', opts)	-- Open Neotree Explorer

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
