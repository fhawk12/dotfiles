-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Pull the rose-pine colorscheme and set it
-- config.color_scheme = "rose-pine"
-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").moon
-- config.colors = theme.colors()
-- config.window_frame = theme.window_frame()

config.color_scheme = "Builtin Solarized Dark"
-- config.color_scheme = "Solarized Dark (Gogh)"
-- config.color_scheme = "Gruvbox Material (Gogh)"

-- Font
config.font_size = 24
config.font = wezterm.font_with_fallback({
	{ family = "Iosevka Nerd Font Mono" },
	-- { family = "GohuFont 14 Nerd Font Mono" },
	-- { family = "Operator Mono Lig Book" },
	-- { family = "Input Mono Compressed" },
	-- { family = "Terminess Nerd Font" },
	-- { family = "Hack Nerd Font Mono" },
	-- { family = "Fira Code" },
	-- { family = "Comic Mono" },
	-- { family = "Comic Code" },
	-- { family = "Monaspace Radon Nf" },
	-- { family = "JetBrains Mono" },
})

-- Appearence
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
-- config.window_padding = {
-- 	left = 5,
-- 	right = 5,
-- 	top = 5,
-- 	bottom = 5,
-- }

config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
-- config.term = "xterm-256color"

return config
