-- ################
-- ### MONITORS ###
-- ################

-- hl.monitor({ output = "eDP-1", mode = "2256x1504@60", position = "0x0", scale = "1.57" })
hl.monitor({ output = "eDP-1", mode = "2256x1504@60", position = "0x0", scale = "1.175" })

-- main monitor
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x250", scale = "0.8" })
hl.monitor({ output = "DP-1", mode = "2560x1440@165", position = "2400x0", scale = "1", supports_hdr = true })
hl.monitor({ output = "DP-3", mode = "2560x1440@120", position = "4960x0", scale = "1" })
hl.workspace_rule({ workspace = "3", monitor = "DP-3" })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "1", monitor = "DP-1" })

-- ##########################
-- ### SPECIAL WORKSPACES ###
-- ##########################

-- hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "special:email", on_created_empty = "thunderbird" })
hl.workspace_rule({ workspace = "special:im", on_created_empty = "telegram-desktop" })

require("conf.theme")
require("conf.keybinds")
require("conf.envs")
require("conf.autostart")
require("conf.general")
require("conf.animations")
require("conf.gestures")
require("conf.windowRules")
