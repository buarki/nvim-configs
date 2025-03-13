-- local M = {}

-- function M.get_git_blame()
--     local file = vim.fn.expand("%:p")  -- Get full file path
--     local line = vim.fn.line(".")      -- Get current line number
--     local cmd = "git blame -L " .. line .. "," .. line .. " -- " .. file
--     local output = vim.fn.systemlist(cmd)

--     if #output == 0 or string.find(output[1], "^fatal:") then
--         print("No git blame info available")
--         return
--     end

--     local parts = vim.split(output[1], "%s+")
--     local hash = parts[1]
--     local author = parts[2]

--     -- Add virtual text using extmarks
--     local current_buf = vim.api.nvim_get_current_buf()
--     local current_win = vim.api.nvim_get_current_win()
--     local current_line = vim.api.nvim_win_get_cursor(current_win)[1] - 1  -- line number is 1-based, so subtract 1

--     -- Create a namespace (this ensures a unique namespace ID)
--     local ns_id = vim.api.nvim_create_namespace('git_blame')

--     -- Define the virt_text to be displayed
--     local virt_text = {{" 🔍 Last edited by: " .. author .. " (" .. hash .. ")", "Comment"}}

--     -- Options for the extmark
--     local opts = {
--         virt_text = virt_text,             -- The virtual text to show
--         virt_text_pos = 'eol',--'overlay',         -- Display the text on top of the line
--         hl_mode = 'combine',               -- Highlight mode
--     }

--     -- Create the extmark at the current line and column 0
--     local mark_id = vim.api.nvim_buf_set_extmark(current_buf, ns_id, current_line, 0, opts)

--     -- Optionally store mark_id if you want to clear or modify it later
--     -- You can clear this mark using: vim.api.nvim_buf_del_extmark(current_buf, ns_id, mark_id)
-- end

-- function M.setup()
--     vim.api.nvim_set_keymap("n", "<Leader>gb", ":lua require('gitlens.git_blame').get_git_blame()<CR>", { noremap = true, silent = true })
-- end

-- return M

-- Define a global variable to store the extmark ID

local M = {}

local extmark_id = nil
local ns_id = vim.api.nvim_create_namespace('git_blame_ns')  -- Create namespace once

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
    local blame_msg = "🔍 Last edited by: " .. author .. " in commit " .. hash

    -- Get the buffer number
    local bufnr = vim.fn.bufnr('%')

    -- If extmark_id exists, remove it
    if extmark_id then
        vim.api.nvim_buf_del_extmark(bufnr, ns_id, extmark_id)
        extmark_id = nil  -- Reset extmark_id after removal
    end

    -- Add new virtual text (blame message) at the right of the line
    extmark_id = vim.api.nvim_buf_set_extmark(bufnr, ns_id, line - 1, -1, {
        virt_text = {{blame_msg, 'Comment'}},  -- You can customize the highlight group here
        virt_text_pos = 'inline',--'eol',  -- Position it at the end of the line
        hl_mode = 'combine',
    })

    vim.cmd('redraw')
end

function M.setup()
    -- Setup keybinding
    vim.api.nvim_set_keymap("n", "<Leader>gb", ":lua require('gitlens.git_blame').get_git_blame()<CR>", { noremap = true, silent = true })
end

return M
