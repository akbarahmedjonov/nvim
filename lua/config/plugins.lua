-- Main plugins
local function github(plugins)
    local result = {}
    for _, p in ipairs(plugins) do
        table.insert(result, "https://github.com/" .. p)
    end
    return result
end

vim.pack.add(github({
    "neovim/nvim-lspconfig",
    "ellisonleao/gruvbox.nvim", -- Swapped from tokyonight
    "stevearc/oil.nvim",
    "stevearc/conform.nvim",
    "nvim-tree/nvim-web-devicons",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "nvim-lualine/lualine.nvim",
    "brenoprata10/nvim-highlight-colors",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
}))

-- UI and Tools
-- require("lualine").setup()
require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_format" },
        toml = { "taplo" },
        html = { "prettier" },
        css = { "prettier" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        rust = { "rustfmt" },
        lua = { "stylua" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

-- Theme
require("gruvbox").setup({ 
    transparent_mode = true, -- Enables background transparency
})
vim.cmd("colorscheme gruvbox")

require("oil").setup()
require("nvim-highlight-colors").setup({})

-- Lsp and completions
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
        ["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion menu
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Cycle down menu
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Cycle up menu
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Pull autocomplete suggestions from language servers
        { name = "luasnip" }, -- Pull autocomplete suggestions from snippets
        { name = "path" }, -- directories + files
        { name = "buffer" },
    }),
    completion = {
        keyword_length = 1, -- start suggesting after 1 character
    },
})

-- 4. LSP and Server Configuration
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "pyright", "ts_ls", "lua_ls", "clangd", "rust_analyzer", "html", "cssls" }

for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        capabilities = capabilities,
    })
    vim.lsp.enable(server)
end

-- Add handy shortcuts that trigger only when an LSP connects to a file
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end,
})
