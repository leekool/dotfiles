vim.g.mapleader = " "

-- save/quit
vim.keymap.set({ 'n', 'v' }, '<leader>fs',
    function()
        vim.cmd('w')
    end,
    { desc = 'save' })

vim.keymap.set({ 'n', 'v' }, '<leader>fq',
    function()
        vim.cmd('q')
    end,
    { desc = 'quit' })

-- telescope
vim.keymap.set('n', '<leader>.',
    function()
        vim.cmd('Telescope file_browser path=%:p:h select_buffer=true hidden=true')
    end,
    { desc = 'find file' })

vim.keymap.set('n', '<leader>,', require('telescope.builtin').buffers,
    { desc = 'switch buffer' })

vim.keymap.set('n', '<leader>ss',
    function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('grep > ') })
    end,
    { desc = 'grep string' })

-- buffer movement
vim.keymap.set({ 'n', 'v' }, '<leader><TAB>',
    function()
        vim.cmd('b#')
    end,
    { desc = 'previous buffer' })

-- ctrl + up/down -> next empty line
vim.keymap.set({ 'n', 'v' }, '<C-up>', '<S-{>')
vim.keymap.set({ 'n', 'v' }, '<C-down>', '<S-}>')
vim.keymap.set('i', '<C-up>', '<esc><S-{>i')
vim.keymap.set('i', '<C-down>', '<esc><S-}>i')

-- ctrl + backspace/delete whole word
vim.keymap.set('i', '<M-BS>', '<C-W>')
vim.keymap.set('i', '<C-Del>', 'X<Esc>lbce')

-- alt + up/down swap lines
vim.keymap.set({ 'n', 'v' }, '<M-up>', 'ddkkp')
vim.keymap.set({ 'n', 'v' }, '<M-down>', 'ddp')
vim.keymap.set('i', '<M-up>', '<esc>ddkkpi')
vim.keymap.set('i', '<M-down>', '<esc>ddpi')

-- alt + left/right swap chars
vim.keymap.set({ 'n', 'v' }, '<M-left>', 'Xph')
vim.keymap.set({ 'n', 'v' }, '<M-right>', 'xp')
vim.keymap.set('i', '<M-left>', '<esc>Xpi')
vim.keymap.set('i', '<M-right>', '<esc>lxpi')

-- leader + leader -> :so
vim.keymap.set('n', '<leader><leader>',
    function()
        vim.cmd('so')
    end,
    { desc = ':so' })

-- trouble (diagnostics)
vim.keymap.set('n', '<leader>!', '<cmd>TroubleToggle document_diagnostics<cr>',
    { silent = true, noremap = true, desc = 'diagnostics' }
)

-- format
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
