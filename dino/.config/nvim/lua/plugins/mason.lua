-- lua/plugins/mason.lua
require("mason").setup()

-- Installs these servers on a fresh machine. Server configs live in lua/lsp/.
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "ty" },
  automatic_enable = false, -- enabled explicitly in lua/lsp/init.lua
})
