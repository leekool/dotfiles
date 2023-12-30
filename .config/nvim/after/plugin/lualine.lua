require("lualine").setup({
    options = {
        fmt = string.lower,
        component_separators = { left = '', right = '' },
        icons_enabled = true,
        theme = "auto",
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        -- lualine_a = {
        --     { "mode", fmt = function(str) return str:sub(1, 1) end }
        -- },
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = {
            "filename",
            { "filesize", color = { fg = "#30304a" } }
        },
        -- lualine_c = { "filename", "filesize" },
        lualine_x = { "diff", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
    disabled_filetypes = { "NVimTree" },
})
