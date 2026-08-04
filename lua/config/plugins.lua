local function github(plugins)
	local result = {}
	for _, p in ipairs(plugins) do
		table.insert(result, "https://github.com/" .. p)
	end
	return result
end

vim.pack.add(github({
	"neovim/nvim-lspconfig",
	"rose-pine/neovim",
	"stevearc/oil.nvim",
	"stevearc/conform.nvim",
	"nvim-tree/nvim-web-devicons",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"brenoprata10/nvim-highlight-colors",
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
}))

require("conform").setup({
	formatters_by_ft = {
		python = { "ruff_format" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		rust = { "rustfmt" },
		lua = { "stylua" },
		js = { "prettier" },
		jsx = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		tsx = { "prettier" },
		nix = { "alejandra" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.cmd("hi Directory guibg=NONE")
vim.cmd("hi SignColumn guibg=NONE")
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.cmd.colorscheme("rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require("oil").setup({
	view_options = {
		show_hidden = true,
		is_hidden_file = function(name, bufnr)
			return vim.startswith(name, ".")
		end,
		is_always_hidden = function(name, bufnr)
			return false
		end,
	},
})
require("nvim-highlight-colors").setup({})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	}),
	completion = {
		keyword_length = 1,
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "pyright", "lua_ls", "clangd", "rust_analyzer", "ts_ls", "html", "css_ls", "nil_ls" }

for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		capabilities = capabilities,
	})
	vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})
