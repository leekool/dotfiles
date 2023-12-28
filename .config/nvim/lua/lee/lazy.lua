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

    "VonHeikemen/lsp-zero.nvim",

    "nvim-lua/lsp-status.nvim",

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    { "onsails/lspkind-nvim" },

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

    { 
        "windwp/nvim-autopairs",
        config =
            function() 
	            require("nvim-autopairs").setup {} 
    	    end,
    },

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

    { "catppuccin/nvim", name = "catppuccin" },

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
                    dim = true, -- dim all other characters if true
                }
            end,
    },

    {
        "nmac427/guess-indent.nvim",
        config = function() require("guess-indent").setup {} end,
    },

    { 
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
    },

    { 
        "n-shift/scratch.nvim",
        config =
            function()
                require("telescope").load_extension("scratch")
            end,
    },

    "frabjous/knap",
    "rhysd/git-messenger.vim",
    "ray-x/go.nvim",
    "ray-x/guihua.lua",
    "nvim-lua/plenary.nvim",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    "akinsho/bufferline.nvim",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-repeat",
    "tpope/vim-fugitive",
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "xiyaowong/transparent.nvim",
    "ggandor/leap.nvim",
})
