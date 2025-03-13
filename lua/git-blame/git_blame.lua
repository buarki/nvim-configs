-- ~/.config/nvim/lua/git-blame/git_blame.lua
local M = {}

function M.get_git_blame()
    local file = vim.fn.expand("%:p")  -- Get full file path
    local line = vim.fn.line(".")      -- Get current line number
    local cmd = "git blame -L " .. line .. "," .. line .. " -- " .. file
    local output = vim.fn.systemlist(cmd)

    if #output == 0 or string.find(output[1], "^fatal:") then
        print("No git blame info available")
        return
    end

    local parts = vim.split(output[1], "%s+")
    local hash = parts[1]
    local author = parts[2]
    print("🔍 Last edited by: " .. author .. " in commit " .. hash)
end

function M.setup()
    -- Optional key bindings for Git Blame
    vim.api.nvim_set_keymap("n", "<Leader>gb", ":lua require('git-blame.git_blame').get_git_blame()<CR>", { noremap = true, silent = true })
end

return M
