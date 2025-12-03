local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 16
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
config.window_background_opacity = 0.9
config.macos_window_background_blur = 70 
config.text_background_opacity = 0.9
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 5
}

config.disable_default_key_bindings = true
config.keys = {
  { key = "Enter", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "c", mods = "CMD", action = wezterm.action.CopyTo "Clipboard" },
  { key = "v", mods = "CMD", action = wezterm.action.PasteFrom "Clipboard" },
  { key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab { confirm = false } }

}

return config
