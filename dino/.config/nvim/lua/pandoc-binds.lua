-- lua/pandoc-binds.lua
-- df nvim configs
-- Interoperability with pandoc

local function get_frontmatter_template(file)
    local lines = vim.fn.readfile(file, '', 20) -- read first 20 lines
    local in_fm = false
    for _, line in ipairs(lines) do
        if line == '---' then
            if not in_fm then in_fm = true
            else break end
        elseif in_fm then
            local val = line:match('^template:%s*(.+)$')
            if val then return val end
        end
    end
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
    vim.keymap.set('n', '<leader>pr', function()
        local file = vim.fn.expand('%:p')
        if vim.bo.filetype == 'markdown' then
            local out = vim.fn.fnamemodify(file, ':r') .. '.pdf'
            local cmd = { 'pandoc', file, '-o', out, '--pdf-engine=xelatex' }
            local tmpl = get_frontmatter_template(file)
            if tmpl then
                table.insert(cmd, '--template=' .. tmpl)
            end
            vim.fn.jobstart(cmd, {
                on_exit = function(_, code)
                    if code == 0 then
                        vim.notify('PDF exported: ' .. out)
                    else
                        vim.notify('pandoc failed (exit ' .. code .. ')', vim.log.levels.ERROR)
                    end
                end,
            })
        else
            vim.notify('Not a markdown file', vim.log.levels.WARN)
        end
        end, { buffer = true, desc = 'Export markdown to PDF via pandoc' })
    end,
})
