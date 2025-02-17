local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
            { "nvim-treesitter/playground" },
            { "romgrk/nvim-treesitter-context" },
        },
    },

    {
        'stevearc/conform.nvim',
        opts = {},
    },

    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",

    "VonHeikemen/lsp-zero.nvim",

    "nvim-lua/lsp-status.nvim",

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    { "onsails/lspkind.nvim" },

    -- autocompletion
    { "hrsh7th/cmp-nvim-lsp" },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "saadparwaiz1/cmp_luasnip" },
            {
                'L3MON4D3/LuaSnip',
                dependencies = {
                    { 'rafamadriz/friendly-snippets' },
                },
            },
            { "hrsh7th/cmp-nvim-lua" },
            { "quangnguyen30192/cmp-nvim-tags" },
            { "petertriho/cmp-git" },
        },
    },

    "folke/which-key.nvim",
    "folke/trouble.nvim",

    {
        "numToStr/Comment.nvim",
        config =
            function()
                require("Comment").setup()
            end,
    },

    { "windwp/nvim-autopairs" },

    {
        "windwp/nvim-ts-autotag",
        config =
            function()
                require "nvim-treesitter.configs".setup {
                    autotag = { enable = true, }
                }
            end,
    },

    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-file-browser.nvim",

    { "catppuccin/nvim",       name = "catppuccin" },
    { "rebelot/kanagawa.nvim", name = "kanagawa" },

    {
        "folke/noice.nvim",
        dependencies = {
            { "rcarriga/nvim-notify" },
            { "MunifTanjim/nui.nvim" },
        },
    },

    {
        "andymass/vim-matchup",
        config =
            function()
                vim.g.matchup_matchparen_offscreen = { method = "popup" }
            end,
    },

    {
        "jinh0/eyeliner.nvim",
        config =
            function()
                require "eyeliner".setup {
                    highlight_on_key = true, -- show highlights only after keypress
                    dim = true,              -- dim all other characters if true
                }
            end,
    },

    {
        "nmac427/guess-indent.nvim",
        config = function() require("guess-indent").setup {} end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config =
            function()
                vim.opt.termguicolors = true
                require("colorizer").setup()
            end,
    },

    -- {
    --     "n-shift/scratch.nvim",
    --     config =
    --         function()
    --             require("telescope").load_extension("scratch")
    --         end,
    -- },
    {
        "LintaoAmons/scratch.nvim",
        -- event = "VeryLazy",
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    "frabjous/knap",
    "rhysd/git-messenger.vim",
    "ray-x/go.nvim",
    "ray-x/guihua.lua",
    "nvim-lua/plenary.nvim",
    "akinsho/bufferline.nvim",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-repeat",
    "tpope/vim-fugitive",
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "xiyaowong/transparent.nvim",
    "ggandor/leap.nvim",
    "Eandrju/cellular-automaton.nvim",

    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = false,
        ft = "markdown"
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua",      -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
})
