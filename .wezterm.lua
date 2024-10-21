-- Pull in the wezterm API
local os              = require 'os'
local wezterm         = require 'wezterm'
local act             = wezterm.action
local mux             = wezterm.mux

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.wsl_domains = {
  {
    -- The name of this specific domain.  Must be unique amonst all types
    -- of domain in the configuration file.
    name = 'WSL:Ubuntu',

    -- The name of the distribution.  This identifies the WSL distribution.
    -- It must match a valid distribution from your `wsl -l -v` output in
    -- order for the domain to be useful.
    distribution = 'Ubuntu',
    default_cwd = '~',
    default_prog = { "zsh" },
  },
}
config.default_domain = 'WSL:Ubuntu'

config.automatically_reload_config = true
config.hide_tab_bar_if_only_one_tab = true
-- config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.mouse_bindings = {
    -- Open URLs with Ctrl+Click
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    }
}
config.pane_focus_follows_mouse = true
config.scrollback_lines = 10000
config.window_decorations = 'RESIZE'
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
config.switch_to_last_active_tab_when_closing_tab = true
config.colors = {
    tab_bar = {
        active_tab = {
            fg_color = '#073642',
            bg_color = '#2aa198',
        } 
    }
}
config.font_size = 18.0
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = 'Nord (base16)'
config.audible_bell = "Disabled"


-- Setup muxing by default
config.unix_domains = {
  {
    name = 'unix',
  },
}

-- Custom key bindings
config.keys = {
    -- -- Disable Alt-Enter combination (already used in tmux to split pane)
    -- {
    --     key = 'Enter',
    --     mods = 'ALT',
    --     action = act.DisableDefaultAssignment,
    -- },

    -- Copy mode
    -- {
    --     key = '[',
    --     mods = 'LEADER',
    --     action = act.ActivateCopyMode,
    -- },

    -- ----------------------------------------------------------------
    -- TABS
    --
    -- Where possible, I'm using the same combinations as I would in tmux
    -- ----------------------------------------------------------------

    -- Show tab navigator; similar to listing panes in tmux
    -- {
    --     key = 'w',
    --     mods = 'LEADER',
    --     action = act.ShowTabNavigator,
    -- },
    -- Create a tab (alternative to Ctrl-Shift-Tab)
    -- {
    --     key = 'c',
    --     mods = 'LEADER',
    --     action = act.SpawnCommandInNewTab {
    --         cwd = '~',
    --         domain = 'CurrentPaneDomain',
    --     }
    -- },
    -- Rename current tab; analagous to command in tmux
    -- {
    --     key = ',',
    --     mods = 'LEADER',
    --     action = act.PromptInputLine {
    --         description = 'Enter new name for tab',
    --         action = wezterm.action_callback(
    --             function(window, pane, line)
    --                 if line then
    --                     window:active_tab():set_title(line)
    --                 end
    --             end
    --         ),
    --     },
    -- },
    -- Move to next/previous TAB
    -- {
    --     key = 'n',
    --     mods = 'LEADER',
    --     action = act.ActivateTabRelative(1),
    -- },
    -- {
    --     key = 'p',
    --     mods = 'LEADER',
    --     action = act.ActivateTabRelative(-1),
    -- },
    -- -- Close tab
    -- {
    --     key = '&',
    --     mods = 'LEADER|SHIFT',
    --     action = act.CloseCurrentTab{ confirm = true },
    -- },
    -- -- Go to last tab
    -- {
    --     key = 'l',
    --     mods = 'LEADER',
    --     action = act.ActivateLastTab,
    -- },

    -- ----------------------------------------------------------------
    -- PANES
    --
    -- These are great and get me most of the way to replacing tmux
    -- entirely, particularly as you can use "wezterm ssh" to ssh to another
    -- server, and still retain Wezterm as your terminal there.
    -- ----------------------------------------------------------------

    -- -- Vertical split
    -- {
    --     -- |
    --     key = '|',
    --     mods = 'LEADER|SHIFT',
    --     action = act.SplitPane {
    --         direction = 'Right',
    --         size = { Percent = 50 },
    --     },
    -- },
    -- -- Horizontal split
    -- {
    --     -- -
    --     key = '-',
    --     mods = 'LEADER',
    --     action = act.SplitPane {
    --         direction = 'Down',
    --         size = { Percent = 50 },
    --     },
    -- },
    -- -- Close/kill active pane
    -- {
    --     key = 'x',
    --     mods = 'LEADER',
    --     action = act.CloseCurrentPane { confirm = true },
    -- },
    -- -- Zoom current pane (toggle)
    -- {
    --     key = 'z',
    --     mods = 'LEADER',
    --     action = act.TogglePaneZoomState,
    -- },
    -- -- Move to next/previous pane
    -- {
    --     key = ';',
    --     mods = 'LEADER',
    --     action = act.ActivatePaneDirection('Prev'),
    -- },
    -- {
    --     key = 'o',
    --     mods = 'LEADER',
    --     action = act.ActivatePaneDirection('Next'),
    -- },
    -- {
    --     key = 'a',
    --     mods = 'LEADER|CTRL',
    --     action = act.SendKey { key = 'a', mods = 'CTRL' },
    -- },

    -- ----------------------------------------------------------------
    -- Workspaces
    --
    -- These are roughly equivalent to tmux sessions.
    -- ----------------------------------------------------------------

    -- Show list of workspaces
    -- {
    --     key = 's',
    --     mods = 'LEADER',
    --     action = act.ShowLauncherArgs { flags = 'WORKSPACES' },
    -- },
    -- -- Rename current session; analagous to command in tmux
    -- {
    --     key = '$',
    --     mods = 'LEADER|SHIFT',
    --     action = act.PromptInputLine {
    --         description = 'Enter new name for session',
    --         action = wezterm.action_callback(
    --             function(window, pane, line)
    --                 if line then
    --                     mux.rename_workspace(
    --                         window:mux_window():get_workspace(),
    --                         line
    --                     )
    --                 end
    --             end
    --         ),
    --     },
    -- },
}

-- index based go to tab
-- for i = 1, 9 do
--   -- CTRL+ALT + number to activate that tab
--   table.insert(config.keys, {
--     key = tostring(i),
--     mods = 'LEADER',
--     action = act.ActivateTab(i - 1),
--   })
-- end

return config
