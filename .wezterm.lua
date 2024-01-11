-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config = {
  -- send_composed_key_when_alt_is_pressed = true,
  window_close_confirmation = "NeverPrompt",
  skip_close_confirmation_for_processes_named = {
    'bash',
    'sh',
    'zsh',
    'fish',
    'tmux',
    'zellij',
    'nu',
    'cmd.exe',
    'pwsh.exe',
    'powershell.exe',
  },

  adjust_window_size_when_changing_font_size = false,
  automatically_reload_config = true,
  color_scheme = 'Brogrammer',

  font = wezterm.font 'FiraCode Nerd Font',
  font_size = 16,
  hide_tab_bar_if_only_one_tab = true,

  window_decorations = "RESIZE",
  window_padding = {
    left = 5,
    right = 0,
    top = 5,
    bottom = 0
  },

  window_background_image = wezterm.home_dir .. '/.share/backgrounds/pexels-jacob-lister-haugen-18249971.jpg',
  -- window_background_image = wezterm.home_dir .. '/test.jpg',
  window_background_image_hsb = {
    brightness = 0.05,
    hue = 1.0,
    saturation = 1.0,
  },

  keys = {
    {
      key = '3',
      mods = 'ALT',
      action = wezterm.action.SendKey { key = "#" }
    },
    {
      key = 'P',
      mods = 'CTRL',
      action = 'DisableDefaultAssignment'
    }
  },
}

-- and finally, return the configuration to wezterm
return config
