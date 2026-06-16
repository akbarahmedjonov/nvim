vim.g.mapleader = " "

local options = {
	number = true,
	relativenumber = true,
	cursorline = true,
	clipboard = "unnamedplus",
	mouse = "a",
	ignorecase = true,
	smartcase = true,
	splitright = true,
	splitbelow = true,
	signcolumn = "yes",
	scrolloff = 8,
	swapfile = false,
	wrap = true,
	expandtab = true,
	cindent = true,
	smarttab = true,
	smartindent = true,
	shiftwidth = 4,
	tabstop = 4,
	hlsearch = false,
	incsearch = true,
	termguicolors = true,
	updatetime = 50,
	smoothscroll = true,
	backup = false,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

-- Show errors right away
vim.diagnostic.config({ virtual_text = true })

vim.cmd("packadd nvim.undotree")
