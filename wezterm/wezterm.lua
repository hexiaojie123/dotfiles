local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font")
--config.font = wezterm.font("Hack Nerd Font Mono")

config.color_scheme = "Tokyo Night"
--config.color_scheme = "Catppuccin Mocha"
--config.color_scheme = "Gruvbox Dark"
--config.color_scheme = "Solarized"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 5
}

config.disable_default_key_bindings = true

config.mouse_bindings = {
  { event = { Drag = { streak = 1, button = 'Left' } }, mods = 'CTRL', action = wezterm.action.StartWindowDrag },
  { event = { Up = { streak = 1, button = 'Left' } }, mods = 'NONE', action = wezterm.action.CompleteSelection 'Clipboard' },
  { event = { Down = { streak = 1, button = 'Right' } }, mods = 'NONE', action = wezterm.action.PasteFrom 'Clipboard' },
}

if wezterm.target_triple:find("darwin") then
  config.font_size = 16
  config.window_background_opacity = 0.9
  config.macos_window_background_blur = 70 
  config.text_background_opacity = 0.9
  config.keys = {
    { key = "Enter", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab { confirm = false } },
    { key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
    { key = "v", mods = "CMD", action = wezterm.action.PasteFrom "Clipboard" },
  }
else
  config.font_size = 10
  config.keys = {
    { key = "Enter", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentTab { confirm = false } },
    { key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
    { key = "v", mods = "CTRL", action = wezterm.action.PasteFrom "Clipboard" },
  }
end

return config
