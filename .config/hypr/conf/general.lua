hl.config({
  input = {
    kb_layout = "us",

    repeat_delay = 170,
    repeat_rate = 40,

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.8,
      disable_while_typing = true,
      tap_and_drag = true,
    },
  },

  dwindle = {
    preserve_split = true -- You probably want this
  },

  master = {
    new_status = "master"
  },

  misc = {
    force_default_wallpaper = 2,   -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
  },

  binds = {
    scroll_event_delay = 0
  },

  decoration = {
    rounding = 15,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      render_power = 3,
      color = "rgba(1a1a1aee)",
      range = 4,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,

      vibrancy = 0.1696,
    },
  },

  general = {
    gaps_in = 5,
    gaps_out = "5,10,10,10",

    border_size = 2,

    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = { colors = { "rgba(595959aa)" } },
    },

    resize_on_border = false,

    allow_tearing = false,

    layout = "dwindle",
  },
})
