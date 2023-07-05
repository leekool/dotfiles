vim.g.mapleader = " "

-- -- latex
-- -- F5 processes the document once, and refreshes the view
-- vim.keymap.set({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)
-- -- F6 closes the viewer application, and allows settings to be reset
-- vim.keymap.set({ 'n', 'v', 'i' },'<F6>', function() require("knap").close_viewer() end)
-- -- F7 toggles the auto-processing on and off
-- vim.keymap.set({ 'n', 'v', 'i' },'<F7>', function() require("knap").toggle_autopreviewing() end)
-- -- F8 invokes a SyncTeX forward search, or similar, where appropriate
-- vim.keymap.set({ 'n', 'v', 'i' },'<F8>', function() require("knap").forward_jump() end)

-- save
vim.keymap.set({ 'n', 'v' }, '<leader>fs',
    function()
        vim.cmd('w')
    end,
    { desc = 'save' })

-- quit
vim.keymap.set({ 'n', 'v' }, '<leader>fq',
    function()
        vim.cmd('q')
    end,
    { desc = 'quit' })

-- TELESCOPE
-- browse in file's directory
vim.keymap.set('n', '<leader>.',
    function()
        vim.cmd('Telescope file_browser path=%:p:h select_buffer=true hidden=true')
    end,
    { desc = 'cd' })

-- switch between open buffers
vim.keymap.set('n', '<leader>,', require('telescope.builtin').buffers,
    { desc = 'switch buffer' })

-- grep string
vim.keymap.set('n', '<leader>ss',
    function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('grep > ') })
    end,
    { desc = 'grep string' })

-- live grep (requires ripgrep)
vim.keymap.set('n', '<leader>sl',
    function()
        require('telescope.builtin').live_grep()
    end,
    { desc = 'live grep' })

-- find references
vim.keymap.set('n', '<leader>fr',
    function()
        require('telescope.builtin').lsp_references()
    end,
    { desc = 'find references' })

-- find definition
vim.keymap.set('n', '<leader>fd',
    function()
        require('telescope.builtin').lsp_definitions()
    end,
    { desc = 'find definition' })

-- find definition
vim.keymap.set('n', '<leader>fi',
    function()
        require('telescope.builtin').lsp_implementations()
    end,

    { desc = 'find implementation' })

-- git status
vim.keymap.set('n', '<leader>Gs',
    function()
        require('telescope.builtin').git_status()
    end,
    { desc = 'git status' })

-- git commits
vim.keymap.set('n', '<leader>Gc',
    function()
        require('telescope.builtin').git_commits()
    end,
    { desc = 'git commits' })

-- git branches
vim.keymap.set('n', '<leader>Gb',
    function()
        require('telescope.builtin').git_branches()
    end,
    { desc = 'git branches' })

vim.keymap.set('n', '<leader>of',
    function()
        vim.cmd('Telescope file_browser path=~/sync/org select_buffer=true hidden=true')
    end,
    { desc = 'org folder (telescope)' })

-- buffer movement
vim.keymap.set({ 'n', 'v' }, '<leader><TAB>',
    function()
        vim.cmd('b#')
    end,
    { desc = 'previous buffer' })

-- undotree toggle
vim.keymap.set('n', '<leader>u',
    function()
        vim.cmd('UndotreeToggle')
    end,
    { desc = 'undotree toggle' })

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
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = 'format buffer' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remaps ever (copy/paste from clipboard)
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

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
