-- lua/plugins/lsp.lua
return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "rust_analyzer", "clangd" },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      require("lsp")  -- guaranteed to run after all dependencies are loaded
    end,
  },
}
