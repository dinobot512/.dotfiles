-- lua/plugins/telescope.lua
-- Fuzzy finder. Uses ripgrep for file listing and live grep.
-- Inside a picker: C-n/C-p move, CR open, C-x/C-v split, C-q send to quickfix
require("telescope").setup({})

local builtin = require("telescope.builtin")
local map = function(lhs, fn, desc)
  vim.keymap.set("n", lhs, fn, { desc = desc })
end
-- README layout (<leader>f*)
map("<leader>ff", builtin.find_files, "Telescope find files")
map("<leader>fg", builtin.live_grep, "Telescope live grep")
map("<leader>fb", builtin.buffers, "Telescope buffers")
map("<leader>fh", builtin.help_tags, "Telescope help tags")
-- Extras
map("<leader>fw", builtin.grep_string, "Telescope grep word under cursor")
map("<leader>fd", builtin.diagnostics, "Telescope diagnostics")
map("<leader>fr", builtin.resume, "Telescope resume last search")
map("<C-Space>", builtin.find_files, "Telescope find files")
