local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      n = {
          ['<C-d>'] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
        ["<C-h>"] = "which_key",
        ['<C-d>'] = require('telescope.actions').delete_buffer,
        ['<C-n>'] = fb_actions.create
      } -- i
    } -- mappings
  }, -- defaults
...
}

-- local builtin = require('telescope.builtin')

-- vim.keymap.set('n', '<leader>,', builtin.buffers, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
