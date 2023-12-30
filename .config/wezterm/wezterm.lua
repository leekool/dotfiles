local wezterm = require 'wezterm'
local c = {}

local tab_background_color = 'rgba(30, 30, 42, 0.975)'

c.color_scheme = 'Catppuccin Mocha (Gogh)'

c.colors = {
    tab_bar = {
        background = tab_background_color,
        -- inactive_tab = {
        --     bg_color = tab_background_color,
        --     fg_color = tab_background_color,
        -- },
        new_tab = {
            bg_color = tab_background_color,
            fg_color = '#45475a',
        },
        new_tab_hover = {
            bg_color = tab_background_color,
            fg_color = '#a6e3a1',
        },
    },
}

c.hide_tab_bar_if_only_one_tab = true
c.use_fancy_tab_bar = false

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider -- <
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider -- >

local function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- otherwise, use the title from the active pane in that tab
    return tab_info.active_pane.title
end

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local edge_background = tab_background_color
        local background = tab_background_color
        local foreground = '#bac2de'

        if tab.is_active then
            background = '#000'
            foreground = '#bac2de'
        elseif hover then
            background = 'rgba(59, 48, 82, 1)'
            foreground = '#bac2de'
        else
            background = 'rgba(43, 32, 66, 1)'
            foreground = '#bac2de'
        end

        local edge_foreground = background

        local title = tab_title(tab)

        -- ensure that the titles fit in the available space,
        -- and that we have room for the edges
        title = wezterm.truncate_right(title, max_width - 2)

        return {
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_LEFT_ARROW },
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = title },
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_RIGHT_ARROW },
      }
    end
)

c.window_close_confirmation = 'NeverPrompt'

c.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })
c.font_size = 11.0

c.window_padding = { left = 9, right = 9, top = 8, bottom = 0 }
c.window_background_opacity = 0.975

return c
