-- lua/plugins/harpoon.lua

local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

for i = 1, 9 do
    vim.keymap.set("n", "m" .. i, function()
        harpoon:list():replace_at(i)
    end, { desc = "Harpoon: mark file as " .. i })
    vim.keymap.set("n", "'" .. i, function()
        harpoon:list():select(i)
    end, { desc = "Harpoon: go to file " .. i })
end
