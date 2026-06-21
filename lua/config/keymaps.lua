vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

-- NAVIGATION

set("n", "<leader>cd", "<CMD>Oil<CR>", { desc = "Open parent directory" })
set("n", "<leader>ff", "<CMD>Telescope fd<CR>", { desc = "Telescope find files" })
set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Telescope find buffers" })
set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Telescope grep strings" })
set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Telescope recent files" })

set("n", "<leader>u", "<CMD>Undotree<CR>", { desc = "Toggle undotree" })

set("v", "J", ":m '>+1<CR>gv=gv") -- Alt Up/Down in vscode
set("v", "K", ":m '<-2<CR>gv=gv")

-- Move between splits using Ctrl + h/j/k/l
set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

set("n", "<leader>cx", "<C-w>q", { desc = "Close current split window" })

-- Close current buffer/tab cleanly
set("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Close current tab" })
