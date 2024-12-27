
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
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- FzfLua
vim.keymap.set('n', '<leader>g', ':FzfLua live_grep<CR>', opts)	-- search live text in current working directory
vim.keymap.set('n', '<leader>p', ':FzfLua files<CR>', opts)	-- search files in current working directory
vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>', opts)

-- Nvim tree
vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)	-- Open Explorer

-- GitSigns
vim.keymap.set('n', '<C-w>p', ':Gitsigns preview_hunk<CR>', opts)	-- For preview git hunk

-- lspconfig
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)	-- go to definition
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)	-- go to definition

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
