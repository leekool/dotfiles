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
    "catppuccin/nvim",
    "folke/noice.nvim",
    "rcarriga/nvim-notify",
    "MunifTanjim/nui.nvim",
    "frabjous/knap",
    "frabjous/knap",
    "rhysd/git-messenger.vim",
    "ray-x/go.nvim",
    "ray-x/guihua.lua",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    "andymass/vim-matchup",
    "nvim-treesitter/nvim-treesitter",
    "n-shift/scratch.nvim",
    "akinsho/bufferline.nvim",
    "jinh0/eyeliner.nvim",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-repeat",
    "tpope/vim-fugitive",
    -- "kyazdani42/nvim-web-devicons",
    "nvim-treesitter/playground",
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "xiyaowong/transparent.nvim",
    "nvim-lua/lsp-status.nvim",
    "ggandor/leap.nvim",
    "norcalli/nvim-colorizer.lua",
    "nmac427/guess-indent.nvim",

    "VonHeikemen/lsp-zero.nvim",

    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    "folke/trouble.nvim",
    "folke/which-key.nvim",
    "numToStr/Comment.nvim",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
})
