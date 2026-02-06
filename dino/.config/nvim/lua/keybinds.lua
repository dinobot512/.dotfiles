-- lua/keybinds.lua
-- df nvim configs
-- Keybinds
vim.g.mapleader = ' '               -- leader key

-- Window navigation without prefix (Alt key)
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move to right window' })
vim.keymap.set('n', '<M-s>', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<M-v>', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<M-w>', '<C-w>T', { desc = 'Move the current split window into its own tab' })
vim.keymap.set('n', '<tab>', 'gt', { desc = 'Move to next tab' })
vim.keymap.set('n', '<S-tab>', 'gT', { desc = 'Move to previous tab' })
vim.keymap.set('n', '<M-q>', '<C-w>q', { desc = 'Quit window' })
--vim.keymap.set('n', '<M-w>', '<cmd>write<cr>', { desc = 'Write buffer' })
--vim.keymap.set('n', '<M-x>', '<cmd>x<cr>', { desc = 'Write buffer and quit window' })

-- Buffers
vim.keymap.set('n', '<Leader>bn', '<cmd>bn<cr>', { desc = 'Go to next buffer'})
vim.keymap.set('n', '<Leader>bp', '<cmd>bp<cr>', { desc = 'Go to previous buffer'})

-- File explorer
vim.keymap.set('n', '<M-e>', vim.cmd.Ex, { desc = 'Open file explorer' })
-- vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { desc = 'Open nvim-tree' })

-- Quick terminal window
vim.keymap.set('n', '<M-enter>', vim.cmd.ter, { desc = 'Open terminal'})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
