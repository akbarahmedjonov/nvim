vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.swapfile = false
opt.wrap = true
opt.expandtab = true
opt.cindent = true
opt.smarttab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.updatetime = 50
opt.smoothscroll = true
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

vim.diagnostic.config({ virtual_text = true })

vim.cmd("packadd nvim.undotree")
