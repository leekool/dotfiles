local wk = require("which-key")

wk.register({
    G = {
        name = "+git",
    },
    s = {
        name = "+search",
    },
    f = {
        name = "+file/find",
    },
    o = {
        name = "+org",
    },
}, { prefix = "<leader>" })
