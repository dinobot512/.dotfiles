-- lua/lsp/init.lua

-- Remove Global Default Key mapping
vim.keymap.del("n", "grn")  -- removes rename
vim.keymap.del("n", "gra")  -- removes code actions menu
vim.keymap.del("n", "grr")  -- removes list references
vim.keymap.del("n", "gri")  -- removes goto implementation
vim.keymap.del("n", "gO")   -- removes list all symbols in file

-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    vim.keymap.set("n", "gd",         vim.lsp.buf.definition,     opts)
    --vim.keymap.set("n", "K",          vim.lsp.buf.hover,          opts)
    vim.keymap.set("n", "gi",         vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr",         vim.lsp.buf.references,     opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,         opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,    opts)
    vim.keymap.set("n", "<leader>f",  function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

vim.lsp.config.clangd = {
  cmd = { 'clangd', '--background-index', '--clang-tidy' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { 'compile_commands.json', '.git' },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

vim.lsp.enable({ "ty", "clangd", "rust_analyzer"})
