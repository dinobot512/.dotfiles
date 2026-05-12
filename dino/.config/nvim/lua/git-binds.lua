-- lua/git-binds.lua
-- df nvim configs
-- Git sync binds (add all, auto commit, push / pull)

local function git_sync()
    vim.fn.jobstart({ 'git', 'add', '-A' }, {
        on_exit = function(_, add_code)
            if add_code ~= 0 then
                vim.notify('git add failed', vim.log.levels.ERROR)
                return
            end

            local diff = vim.fn.system('git diff --cached --stat')
            if diff == '' then
                vim.notify('Nothing to commit', vim.log.levels.WARN)
                return
            end

            local msg = 'nvim commit: ' .. os.date('%Y-%m-%d %H:%M')

            vim.fn.jobstart({ 'git', 'commit', '-m', msg }, {
                on_exit = function(_, commit_code)
                    if commit_code ~= 0 then
                        vim.notify('git commit failed', vim.log.levels.ERROR)
                        return
                    end

                    vim.fn.jobstart({ 'git', 'push' }, {
                        on_exit = function(_, push_code)
                            if push_code == 0 then
                                vim.notify('Synced: ' .. msg)
                            else
                                vim.notify('git push failed', vim.log.levels.ERROR)
                            end
                        end,
                    })
                end,
            })
        end,
    })
end

local function git_pull()
    vim.fn.jobstart({ 'git', 'pull' }, {
        on_exit = function(_, code)
            if code == 0 then
                vim.notify('git pull complete')
            else
                vim.notify('git pull failed', vim.log.levels.ERROR)
            end
        end,
    })
end

local function git_pull_and_sync()
    vim.fn.jobstart({ 'git', 'pull' }, {
        on_exit = function(_, pull_code)
            if pull_code ~= 0 then
                vim.notify('git pull failed', vim.log.levels.ERROR)
                return
            end
            vim.notify('git pull complete, syncing...')
            git_sync()
        end,
    })
end

vim.keymap.set('n', '<leader>gs', git_sync,          { desc = 'Git sync: add all, auto commit, push' })
vim.keymap.set('n', '<leader>gp', git_pull,          { desc = 'Git pull' })
vim.keymap.set('n', '<leader>gf',    git_pull_and_sync, { desc = 'Git pull then sync' })
