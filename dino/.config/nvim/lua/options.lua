-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spaces in tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of Python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = true             -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- moving status bar to top of windows
vim.o.laststatus = 3
-- vim.o.winbar = '%<%f %h%w%m%r%=%-14.(%l,%c%V%) %P'
vim.api.nvim_set_hl(0, 'WinBar', { link = 'StatusLine' })
vim.api.nvim_set_hl(0, 'WinBarNC', { link = 'StatusLineNC' })

-- Keybinds
vim.g.mapleader = ' '               -- leader key

-- Window navigation without prefix (Alt key)
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move to right window' })
vim.keymap.set('n', '<M-s>', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<M-v>', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<M-q>', '<C-w>q', { desc = 'Quit window' })
vim.keymap.set('n', '<M-w>', vim.cmd.sav, { desc = 'Save window' })
vim.keymap.set('n', '<M-x>', vim.cmd.x, { desc = 'Save and quit window' })

-- File explorer
vim.keymap.set('n', '<M-e>', vim.cmd.Ex, { desc = 'Open file explorer' })
-- vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { desc = 'Open nvim-tree' })

-- Quick terminal window
vim.keymap.set('n', '<M-t>', vim.cmd.ter, { desc = 'Open terminal'})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
