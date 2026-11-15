-- init.lua
-- df nvim configs

-- Core 
require("options")
require("keybinds")
require("pandoc-binds")

-- Plugins
require("plugins")
require("colors")   -- after plugins: needs the colorscheme on runtimepath

-- LSP
require("lsp")
