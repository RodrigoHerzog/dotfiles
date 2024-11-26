local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
local gpus = wezterm.gui.enumerate_gpus()
config.webgpu_preferred_adapter = gpus[1]

config.front_end = "OpenGL"
config.max_fps = 60
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color"

config.font = wezterm.font("IosevkaTerm Nerd Font")
config.cell_width = 0.9
config.window_background_opacity = 0.45
config.prefer_egl = true
config.font_size = 12.0

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.inactive_pane_hsb = {
	saturation = 0.0,
	brightness = 1.0,
}

config.keys = {
	{
		key = 'W',
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab { confirm = false },
	},
	{
		key = 'W',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action.CloseCurrentPane { confirm = false },
	},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "U",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "I",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
	{
		key = "O",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.45
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}

config.color_scheme = "tokyonight_night"
config.colors = {
	tab_bar = {
		background = "rgba(0, 0, 0, 30%)",
		active_tab = {
			bg_color = "rgba(0, 0, 0, 30%)",
			fg_color = "rgba(255, 255, 255, 100%)",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "rgba(0, 0, 0, 40%)",
			fg_color = "rgba(150, 150, 150, 100%)",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		new_tab = {
			bg_color = "rgba(0, 0, 0, 40%)",
			fg_color = "rgba(255, 255, 255, 100%)",
		},
	},
}


config.window_frame = {
	font = wezterm.font({ family = "IosevkaTerm Nerd Font", weight = "Regular" }),
	active_titlebar_bg = "rgba(0, 0, 0, 30%)",
}

config.window_decorations = "TITLE | RESIZE"
-- config.default_prog = { "powershell.exe", "-NoLogo"}
config.default_domain = 'WSL:Ubuntu'

config.window_background_opacity = 0.45
config.win32_system_backdrop = 'Acrylic'

return config
