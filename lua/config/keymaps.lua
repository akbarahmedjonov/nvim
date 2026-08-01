vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

-- NAVIGATION

set("n", "<leader>cd", "<CMD>Oil<CR>", { desc = "Open parent directory" })
set("n", "<leader>ff", "<CMD>Telescope fd<CR>", { desc = "Telescope find files" })
set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Telescope find buffers" })
set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Telescope grep strings" })
set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Telescope recent files" })

set("n", "<leader>fc", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end)

set("n", "<leader>u", "<CMD>Undotree<CR>", { desc = "Toggle undotree" })

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Close current tab" })
