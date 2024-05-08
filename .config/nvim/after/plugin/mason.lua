require("mason").setup({
    PATH = "prepend",
})

local lsp = require("lsp-zero")

require("mason-lspconfig").setup({
    ensure_installed = {
        "tsserver",
        "rust_analyzer",
        "lua_ls",
    },
    handlers = {
        lsp.default_setup,
    }
})
