-- ~/.config/nvim/lua/git-blame/git_history.lua
local M = {}

function M.show_git_log()
    local file = vim.fn.expand("%:p") -- Get the file path
    local cmd = "git log --oneline -- " .. file
    local output = vim.fn.systemlist(cmd)

    if #output == 0 then
        print("No commit history available")
        return
    end

    -- Open results in a vertical split
    vim.cmd("vnew")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
end

function M.setup()
    -- Optional key bindings for Git History
    vim.api.nvim_set_keymap("n", "<Leader>gh", ":lua require('git-blame.git_history').show_git_log()<CR>", { noremap = true, silent = true })
end

return M
