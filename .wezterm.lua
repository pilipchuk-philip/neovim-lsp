-- Pull in the wezterm API
local wezterm                       = require 'wezterm'

-- This will hold the configuration.
local config                        = wezterm.config_builder()
config.font                         =
    wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold', italic = true })
config.font_size                    = 14
config.hide_tab_bar_if_only_one_tab = true
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme                 = 'Catppuccin Mocha'
config.font                         = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.window_frame                 = {
    font_size = 11,
}

config.window_padding               = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
