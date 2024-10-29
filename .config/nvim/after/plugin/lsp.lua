local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('zls', {
    cmd = { '/home/lee/clone/zls/zig-out/bin/zls' },
    settings = {
        zls = {
            enable_snippets = true,
            enable_ast_check_diagnostics = true,
            enable_autofix = true,
            enable_import_embedfile_argument_completions = true,
            warn_style = true,
            enable_semantic_tokens = true,
            enable_inlay_hints = true,
            inlay_hints_hide_redundant_param_names = true,
            inlay_hints_hide_redundant_param_names_last_token = true,
            operator_completions = true,
            include_at_in_builtins = true,
            max_detail_length = 1048576,
            -- build_runner_path = 
        }
    }
})


local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim-lsp' }
    }
})


-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    }
})

-- lsp.set_sign_icons({
--     error = '✘',
--     warn = '▲',
--     hint = '⚑',
--     info = '»'
-- })

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('lspconfig').html.setup({
    filetypes = { "html", "templ" }
})

require('lspconfig').htmx.setup({
    filetypes = { "html", "templ" }
})

vim.g.zig_fmt_autosave = 0

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
