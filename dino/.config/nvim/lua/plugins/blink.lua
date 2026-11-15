-- lua/plugins/blink.lua
-- Completion. See :h blink-cmp-config
require("blink.cmp").setup({
  -- 'default': C-y accept, C-space menu/docs, C-n/C-p select, C-e hide, C-k signature
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },
  completion = { documentation = { auto_show = false } },
  sources = { default = { "lsp", "path", "buffer" } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
