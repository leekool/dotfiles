-- load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- treesitter
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
    },
    ensure_installed = { 'org' }, -- Or run :TSUpdate org
}

require('orgmode').setup({
    win_split_mode = 'float',
    org_todo_keywords = {
        'TODO(t)', 'NEXT(n)', 'BLOCK(b)', '|', 'SKIP(s)', 'DONE(d)'
    },
    org_agenda_files = {
        '~/sync/org/*'
    },
    org_default_notes_file = '~/sync/org/refile.org',
    org_capture_templates = {
        t = {
            description = 'todo',
            template = '* TODO %?\n %u',
            target = '~/sync/org/todo.org'
        },
        n = {
            description = 'note',
            template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
            target = '~/sync/org/refile.org'
        },
        e = 'event',
        er = {
            description = 'recurring',
            template = '** %?\n %T',
            target = '~/sync/org/calendar.org',
            headline = 'recurring'
        },
        eo = {
            description = 'one-off',
            template = '** %?\n %T',
            target = '~/sync/org/calendar.org',
            headline = 'one-off'
        }
    }
})
