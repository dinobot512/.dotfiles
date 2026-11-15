-- lua/plugins/init.lua
-- df nvim configs
-- Plugin list (vim.pack, built into Neovim 0.12+)
--
-- Install:  happens automatically on startup
-- Update:   :lua vim.pack.update()   (review buffer, :w to apply)
-- Remove:   delete the line below, then :lua vim.pack.del({ "name" })
-- Lockfile: nvim-pack-lock.json in this directory (commit it)

local gh = function(repo) return "https://github.com/" .. repo end

-- Build hooks: must be defined before vim.pack.add()
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate") -- keep parsers in sync with the plugin's queries
    end
  end,
})

vim.pack.add({
  -- Completion
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") }, -- tag => prebuilt binary

  -- LSP
  gh("mason-org/mason.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("mason-org/mason-lspconfig.nvim"),

  -- Syntax
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

  -- Fuzzy finder
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-telescope/telescope.nvim"),

  -- Harpoon
  { src = gh("ThePrimeagen/harpoon"), version = "harpoon2" }, -- master is the old v1 API

  -- File tree
  gh("nvim-tree/nvim-tree.lua"),

  -- Colorscheme (applied in lua/colors.lua)
  gh("bluz71/vim-moonfly-colors"),
})

-- Per-plugin setup
require("plugins.mason")      -- before lsp: puts mason's bin/ on PATH
require("plugins.blink")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.harpoon")
