require("mason").setup({
    PATH = "prepend",
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "tsserver",
        "rust_analyzer",
        "lua_ls",
    },
})
