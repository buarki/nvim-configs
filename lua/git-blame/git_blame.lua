-- ~/.config/nvim/lua/git-blame/git_blame.lua
--local M = {}

--function M.get_git_blame()
--    local file = vim.fn.expand("%:p")  -- Get full file path
--    local line = vim.fn.line(".")      -- Get current line number
--    local cmd = "git blame -L " .. line .. "," .. line .. " -- " .. file
--    local output = vim.fn.systemlist(cmd)
--
--    if #output == 0 or string.find(output[1], "^fatal:") then
--        print("No git blame info available")
--        return
--    end

--    local parts = vim.split(output[1], "%s+")
--    local hash = parts[1]
--    local author = parts[2]
--    print("🔍 Last edited by: " .. author .. " in commit " .. hash)
--end

--function M.setup()
    -- Optional key bindings for Git Blame
--    vim.api.nvim_set_keymap("n", "<Leader>gb", ":lua require('git-blame.git_blame').get_git_blame()<CR>", { noremap = true, silent = true })
--end

--return M
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

    -- Add virtual text using extmarks
    local current_buf = vim.api.nvim_get_current_buf()
    local current_win = vim.api.nvim_get_current_win()
    local current_line = vim.api.nvim_win_get_cursor(current_win)[1] - 1  -- line number is 1-based, so subtract 1

    -- Create a namespace (this ensures a unique namespace ID)
    local ns_id = vim.api.nvim_create_namespace('git_blame')

    -- Define the virt_text to be displayed
    local virt_text = {{" 🔍 Last edited by: " .. author .. " (" .. hash .. ")", "Comment"}}

    -- Options for the extmark
    local opts = {
        virt_text = virt_text,             -- The virtual text to show
        virt_text_pos = 'eol',--'overlay',         -- Display the text on top of the line
        hl_mode = 'combine',               -- Highlight mode
    }

    -- Create the extmark at the current line and column 0
    local mark_id = vim.api.nvim_buf_set_extmark(current_buf, ns_id, current_line, 0, opts)

    -- Optionally store mark_id if you want to clear or modify it later
    -- You can clear this mark using: vim.api.nvim_buf_del_extmark(current_buf, ns_id, mark_id)
end

function M.setup()
    vim.api.nvim_set_keymap("n", "<Leader>gb", ":lua require('gitlens.git_blame').get_git_blame()<CR>", { noremap = true, silent = true })
end

return M
