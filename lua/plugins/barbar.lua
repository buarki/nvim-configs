return {
    "romgrk/barbar.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- patched fonts support
        "lewis6991/gitsigns.nvim" -- display git status
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function()
        local barbar = require("barbar")

        barbar.setup({
            clickable = true, -- Enables/disables clickable tabs
            tabpages = false, -- Enable/disables current/total tabpages indicator (top right corner)
            insert_at_end = true,
            icons = {
                button = "",
                buffer_index = true,
                filetype = {enabled = true},
                visible = {modified = {buffer_number = false}},
                gitsigns = {
                    added = {enabled = true, icon = "+"},
                    changed = {enabled = true, icon = "~"},
                    deleted = {enabled = true, icon = "-"}
                }
            }
        })

        -- Keymaps for Barbar
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Move to previous/next buffer
        map("n", "<C->>", "<Cmd>BufferPrevious<CR>", opts)
        map("n", "<C-<>", "<Cmd>BufferNext<CR>", opts)
        -- Re-order to previous/next
        --map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
        --map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
        -- Goto buffer in position...
        map("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", opts)
        map("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", opts)
        map("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", opts)
        map("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", opts)
        map("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", opts)
        map("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", opts)
        map("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", opts)
        -- Pin/unpin buffer
        map("n", "<C-m>", "<Cmd>BufferPin<CR>", opts)
        -- Close buffer
        map("n", "<C-c>", "<Cmd>BufferClose<CR>", opts)
        map("n", "<C-b>", "<Cmd>BufferCloseAllButCurrent<CR>", opts)

        -- Keymaps for splitting and window navigation
        -- Split window vertically
        map("n", "<C-s>", ":vsplit<CR>", opts)
        -- Split window horizontally
        map("n", "<C-v>", ":split<CR>", opts)

        -- Navigate between split windows
        map("n", "<C-h>", "<Cmd>wincmd h<CR>", opts)  -- Move to the left window
        map("n", "<C-l>", "<Cmd>wincmd l<CR>", opts)  -- Move to the right window
        map("n", "<C-k>", "<Cmd>wincmd k<CR>", opts)  -- Move to the top window
        map("n", "<C-j>", "<Cmd>wincmd j<CR>", opts)  -- Move to the bottom window

        -- Close the current window (split)
        map("n", "<C-q>", "<Cmd>q<CR>", opts)  -- Close the current window
    end
}


