vim.g.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmode = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- This keybinding uses jk as escape but don't know if like it
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })

-- moving chunks
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move chunk chunk up 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --  move selected chunk down

-- This keymap clears the search
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", ":!gofmt -w %<CR><CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pp", ":!prettier -w %<CR><CR>", { noremap = true, silent = true }) -- prettier formatter
