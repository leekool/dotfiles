local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 300

wk.register({
    G = {
        name = "+git",
    },
    s = {
        name = "+search/scratch",
    },
    f = {
        name = "+file/find",
    },
    o = {
        name = "+obsidian",
    },
}, { prefix = "<leader>" })
