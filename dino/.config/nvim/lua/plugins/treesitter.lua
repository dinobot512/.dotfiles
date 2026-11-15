-- lua/plugins/treesitter.lua
-- nvim-treesitter (main branch) only installs parsers; highlighting is
-- Neovim's own vim.treesitter, started per buffer below.
-- Requires the `tree-sitter` CLI and a C compiler.

-- Async; already-installed parsers are skipped
require("nvim-treesitter").install({
  "bash", "c", "cpp", "cmake", "json", "lua", "markdown", "markdown_inline",
  "python", "query", "rust", "toml", "vim", "vimdoc", "yaml",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    -- Fails quietly when no parser exists for this filetype
    pcall(vim.treesitter.start, ev.buf)
  end,
})
