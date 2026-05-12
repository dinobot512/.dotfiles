-- render-markdown.lua
return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        latex = {
            enabled = false,
            render_modes = false,
            converter = { 'utftex', 'latex2text' },
            highlight = 'RenderMarkdownMath',
            position = 'center',
            top_pad = 0,
            bottom_pad = 0,
        },
        completions = { lsp = { enabled = true } },
        pipe_table = {
            enabled = true,
            render_modes = false,
            preset = 'none',
            cell = 'padded',
            cell_offset = function()
                return 0
            end,
            padding = 1,
            min_width = 0,
            border = {
                '┌', '┬', '┐',
                '├', '┼', '┤',
                '└', '┴', '┘',
                '│', '─',
            },
            border_enabled = true,
            border_virtual = false,
            alignment_indicator = '━',
            head = 'RenderMarkdownTableHead',
            row = 'RenderMarkdownTableRow',
            style = 'normal',
        },
    },
}
