-- lua/lsp/init.lua
-- df nvim configs
-- Base server configs come from nvim-lspconfig (its lsp/*.lua files).
-- vim.lsp.config() calls here are merged on top and always take precedence.

-- Remove default gr*/gO maps in favor of the ones below
-- (grt/grx are new in 0.12; any leftover gr* default makes `gr` wait 'timeoutlen')
for _, lhs in ipairs({ "grn", "gra", "grr", "gri", "grt", "grx", "gO" }) do
  pcall(vim.keymap.del, "n", lhs)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    -- Formatting: no mapping; use gq (Neovim sets formatexpr to the LSP), e.g. gggqG
  end,
})

-- Server overrides --------------------------------------------------------

vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  root_markers = { "compile_commands.json", ".git" },
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      check = { command = "clippy" },
      inlayHints = {
        chainingHints = { enable = true },
        parameterHints = { enable = true },
        typeHints = { enable = true },
      },
    },
  },
})

-- lua_ls: project settings come from .luarc.json in this config dir.

vim.lsp.enable({ "lua_ls", "ty", "clangd", "rust_analyzer" })
