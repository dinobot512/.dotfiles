-- lua/plugins/nvim-tree.lua
-- File tree side panel; replaces netrw entirely (so :Ex is gone, and
-- `nvim <dir>` / `:e <dir>` open nvim-tree instead).
-- Inside the tree: CR/o open, l expand folder, h parent dir, C-] root at
-- folder (h and C-] only :lcd the tree), = :cd all of nvim into folder,
-- - close tree,
-- a add, d trash, D delete, r rename, x cut, c copy, p paste, H dotfiles,
-- q close, g? help

-- Disable netrw (must run before netrw's plugin file loads)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")

require("nvim-tree").setup({
  view = { width = 32 },
  renderer = { group_empty = true },  -- collapse a/b/c chains into one line
  update_focused_file = { enable = true }, -- follow the current buffer
  -- a :cd from anywhere re-roots the tree to match (h / <C-]> only :lcd the
  -- tree window; '=' below is the one that moves all of nvim)
  sync_root_with_cwd = true,
  trash = { cmd = "gio trash" },  -- same freedesktop trash yazi uses
  on_attach = function(bufnr)
    api.config.mappings.default_on_attach(bufnr)
    local function map(lhs, fn, desc)
      vim.keymap.set("n", lhs, fn,
        { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = "nvim-tree: " .. desc })
    end

    -- file ops matched to yazi: d trash, D delete permanently
    map("d", api.fs.trash, "Trash")
    map("D", api.fs.remove, "Delete permanently")

    -- 'l': expand folders only; does nothing on files (o / <CR> still open both)
    map("l", function()
      local node = api.tree.get_node_under_cursor()
      if node and node.nodes and not node.open then api.node.open.edit() end
    end, "Expand folder")

    -- '=': global :cd into the folder under the cursor (a file's own folder
    -- if on a file) and make it the tree root
    map("=", function()
      local node = api.tree.get_node_under_cursor()
      if not node or not node.absolute_path then return end
      local dir = node.nodes and node.absolute_path
        or vim.fn.fnamemodify(node.absolute_path, ":h")
      vim.cmd.cd(vim.fn.fnameescape(dir))
      api.tree.change_root(dir)
    end, "cd nvim here")

    -- '-': close the tree, but only if there is another buffer to land on
    -- (otherwise do nothing). Never goes to the parent dir.
    map("-", function()
      local tree_buf = vim.api.nvim_get_current_buf()
      -- most recently used listed buffer that isn't the tree
      local target
      for _, info in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        if info.bufnr ~= tree_buf and vim.bo[info.bufnr].filetype ~= "NvimTree"
          and (not target or info.lastused > target.lastused) then
          target = info
        end
      end
      if not target then return end
      -- tree is the only window: make a window for the target buffer first
      if #vim.api.nvim_tabpage_list_wins(0) == 1 then
        vim.cmd("vsplit")
        vim.api.nvim_win_set_buf(0, target.bufnr)
      end
      api.tree.close()
    end, "Close")
  end,
})

-- '-' from a normal buffer: open the tree if needed, jump to it, and reveal
-- the current file (root stays put). Inside the tree, '-' closes it (above).
vim.keymap.set("n", "-", function()
  api.tree.find_file({ open = true, focus = true })
end, { desc = "Focus file tree" })
