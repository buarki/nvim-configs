--return {
 --   "git-blame",
 --   lazy = false,
 --   config = function()
 --       require("git-blame").setup()
 --   end,
--}

-- ~/.config/nvim/lua/plugins/git-blame.lua
return {
    "git-blame",  -- Internal name
    dir = "~/.config/nvim/lua/git-blame",  -- Path to the git-blame plugin folder
    config = function()
        -- Setup the git-blame and git-history
        require("git-blame.git_blame").setup()
        --require("git-blame.git_history").setup()

        -- Optional: Key bindings
        vim.api.nvim_set_keymap("n", "<Leader>gb", ":lua require('git-blame.git_blame').get_git_blame()<CR>", { noremap = true, silent = true })
        --vim.api.nvim_set_keymap("n", "<Leader>gh", ":lua require('git-blame.git_history').show_git_log()<CR>", { noremap = true, silent = true })
    end
}
