require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },

  extra_groups = {
      'GitSignsAdd',
      'GitSignsDelete',
      'GitSignsChange',
      'CursorColumn',
      'TroubleSignError',
      'TroubleSignOther',
      'DiagnosticSignError',
      'DiagnosticSignWarn',
      'DiagnosticSignInfo',
      'DiagnosticSignHint',
      'DiagnosticSignOk',
      'TelescopeBorder',
      'FoldColumn',
      'ColorColumn',
      'WhichKeyBorder',
      'WhichKeyFloat',
      'NormalFloat',
      'FloatShadow',
      'FloatShadowThrough',
      'FloatBorder',
      'FloatermBorder',
      'FloatTitle',
      'TabLine',
      'TabLineFill',
  }, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})
