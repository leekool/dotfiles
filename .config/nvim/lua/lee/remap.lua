vim.g.mapleader = " "

-- latex
-- F5 processes the document once, and refreshes the view
vim.keymap.set({ 'n', 'v', 'i' }, '<F5>', function() require("knap").process_once() end)
-- F6 closes the viewer application, and allows settings to be reset
vim.keymap.set({ 'n', 'v', 'i' }, '<F6>', function() require("knap").close_viewer() end)
-- F7 toggles the auto-processing on and off
vim.keymap.set({ 'n', 'v', 'i' }, '<F7>', function() require("knap").toggle_autopreviewing() end)
-- F8 invokes a SyncTeX forward search, or similar, where appropriate
vim.keymap.set({ 'n', 'v', 'i' }, '<F8>', function() require("knap").forward_jump() end)

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

-- command history
vim.keymap.set('n', '<leader>sc',
    function()
        require('telescope.builtin').command_history()
    end,
    { desc = 'command history' })

-- grep string
vim.keymap.set('n', '<leader>ss',
    function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('grep > ') })
    end,
    { desc = 'grep string' })

-- grep file name
vim.keymap.set('n', '<leader>sf',
    function()
        require('telescope.builtin').find_files({ search = vim.fn.input('grep > ') })
    end,
    { desc = 'grep file name' })

-- grep word
vim.keymap.set('n', '<leader>sw',
    function()
        require('telescope.builtin').grep_string()
    end,
    { desc = 'grep word on cursor' })

-- live grep (requires ripgrep)
vim.keymap.set('n', '<leader>sl',
    function()
        require('telescope.builtin').live_grep()
    end,
    { desc = 'live grep' })

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

-- git grep changed files
vim.keymap.set('n', '<leader>Gg',
    function()
        require('telescope.builtin').git_files()
    end,
    { desc = 'git grep changed files' })

-- git branches
vim.keymap.set('n', '<leader>Gb',
    function()
        require('telescope.builtin').git_branches()
    end,
    { desc = 'git branches' })

-- git messenger (commit inline)
vim.keymap.set('n', '<leader>Gm',
    function()
        vim.cmd('GitMessenger')
    end,
    { desc = 'git messenger (commit inline)' })

-- obsidian folder
vim.keymap.set('n', '<leader>of',
    function()
        vim.cmd('Telescope file_browser path=~/notes select_buffer=true hidden=true')
    end,
    { desc = 'obsidian folder (telescope)' })

-- obsidian new note
vim.keymap.set('n', '<leader>on',
    function()
        vim.ui.input({ prompt = "workspace: " }, function(input)
            vim.cmd(string.format("ObsidianWorkspace %s", input))
        end)
        vim.ui.input({ prompt = "title: " }, function(input)
            vim.cmd(string.format("ObsidianNew %s", input))
        end)
    end,
    { desc = "new note" })

-- obsidian daily note
vim.keymap.set('n', '<leader>od',
    function()
        vim.cmd('ObsidianToday')
    end,
    { desc = "daily notes" })

-- obsidian tomorrow's note
vim.keymap.set('n', '<leader>ot',
    function()
        vim.cmd('ObsidianTomorrow')
    end,
    { desc = "tomorrow's note" })

-- obsidian search notes
vim.keymap.set('n', '<leader>os',
    function()
        vim.cmd('ObsidianSearch')
    end,
    { desc = "search notes" })

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

-- scratch
vim.keymap.set('n', '<leader>sb',
    function()
        vim.cmd('Scratch')
    end,

    { desc = 'new scratch buffer' })

vim.keymap.set('n', '<leader>sm',
    function()
        require("scratch").scratchByType("md")
    end,

    { desc = 'new markdown scratch buffer' })

vim.keymap.set('n', '<leader>sp',
    function()
        vim.cmd('ScratchPad')
    end,

    { desc = 'open scratch pad' })

vim.keymap.set('n', '<leader>so',
    function()
        vim.cmd('ScratchOpen')
    end,

    { desc = 'open scratch file' })

-- vim.keymap.set('n', '<leader>se',
--     function()
--         vim.cmd('ScratchEval')
--     end,
--     { desc = 'eval scratch buffer' })

-- LSP
-- info
vim.keymap.set('n', 'K',
    function()
        vim.lsp.buf.hover()
    end,
    { desc = 'info' })

-- variable rename
vim.keymap.set('n', '<leader>vr',
    function()
        vim.lsp.buf.rename()
    end,
    { desc = 'variable rename' })

-- find definition
vim.keymap.set('n', 'gd',
    function()
        vim.lsp.buf.definition()
    end,
    { desc = 'go to definition' })

vim.keymap.set('n', 'gr',
    function()
        vim.lsp.buf.references()
    end,
    { desc = 'get references' })

-- find references
vim.keymap.set('n', '<leader>fr',
    function()
        require('telescope.builtin').lsp_references()
    end,
    { desc = 'find references' })

-- find definition in telescope
vim.keymap.set('n', '<leader>fd',
    function()
        require('telescope.builtin').lsp_definitions()
    end,
    { desc = 'find definition' })

-- find definition
vim.keymap.set('n', '<leader>fw',
    function()
        vim.lsp.buf.workspace_symbol()
    end,
    { desc = 'find in workspace' })

-- find implementation
vim.keymap.set('n', '<leader>fi',
    function()
        require('telescope.builtin').lsp_implementations()
    end,

    { desc = 'find implementation' })


-- terminal
vim.keymap.set('n', '<leader>to',
    function()
        vim.cmd('ToggleTerm')
    end,
    { desc = 'open terminal' })

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<esc>', [[<C-\><C-n><C-w>q]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- ctrl + up/down -> next empty line
vim.keymap.set({ 'n', 'v' }, '<C-up>', '<S-{>')
vim.keymap.set({ 'n', 'v' }, '<C-down>', '<S-}>')
vim.keymap.set('i', '<C-up>', '<esc><S-{>i')
vim.keymap.set('i', '<C-down>', '<esc><S-}>i')

-- ctrl + backspace/delete whole word
-- vim.keymap.set('i', '<M-BS>', '<C-W>') -- linux <M-BS>
vim.keymap.set('i', '<C-H>', '<C-W>') -- windows <C-H>
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
vim.keymap.set('n', '<leader>!', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    { silent = true, noremap = true, desc = 'diagnostics' }
)

vim.keymap.set('n', '<leader>db', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    { silent = true, noremap = true, desc = 'diagnostics (buffer)' }
)

vim.keymap.set('n', '<leader>da', '<cmd>Trouble diagnostics toggle<cr>',
    { silent = true, noremap = true, desc = 'diagnostics (all)' }
)

vim.keymap.set('n', '<leader>ds', '<cmd>Trouble symbols toggle focus=false<cr>',
    { silent = true, noremap = true, desc = 'symbols' }
)

vim.keymap.set('n', '<leader>dl', '<cmd>Trouble lsp toggle focus=false<cr>',
    { silent = true, noremap = true, desc = 'lsp definitions, references' }
)

vim.keymap.set('n', '<leader>dL', '<cmd>Trouble loclist toggle<cr>',
    { silent = true, noremap = true, desc = 'location list' }
)

vim.keymap.set('n', '<leader>dq', '<cmd>Trouble qflist toggle<cr>',
    { silent = true, noremap = true, desc = 'quickfix list' }
)

-- format
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = 'format buffer' })
vim.keymap.set("n", "<leader>-", require("conform").format, { desc = 'format buffer' }) -- test
vim.keymap.set("v", "<leader>-", require("conform").format, { desc = 'format buffer' }) -- test

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

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
