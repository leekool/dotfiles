require("mason").setup({
    PATH = "prepend",
})

local lsp = require("lsp-zero")

require("mason-lspconfig").setup({
    ensure_installed = {
        "html",
        "svelte",
        "cssls",
        "ts_ls",
        "lua_ls",
    },
    handlers = {
        lsp.default_setup,
    }
})
