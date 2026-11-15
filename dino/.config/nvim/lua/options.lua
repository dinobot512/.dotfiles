-- lua/options.lua
-- df nvim configs

-- `:h <option>` help page for option
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 

-- `'menu'` shows popup menu of candidates rather than inline cycling
-- `'menuone'` shows that menu when there is one match
-- `'noselect'` disables auto-inserting matches
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Mouse Settings
vim.opt.mouse = ""                  -- unset mouse

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spaces in tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of Python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new horizontal split bottom
vim.opt.splitright = true           -- open new vertical splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false            -- show mode hint ( -- INSERT -- )

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- highlight search matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- Status Bar
vim.o.laststatus = 2

-- conceal level
vim.opt.conceallevel = 2

-- spell check
vim.opt.spell = false;
vim.opt.spelllang = "en_us"
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- comment continuation (formatoptions)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "o" }) -- after o/O in normal mode
    --vim.opt_local.formatoptions:remove({ "r" }) -- after newline in insert mode
  end,
})
