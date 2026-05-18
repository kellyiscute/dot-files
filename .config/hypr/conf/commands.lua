local terminal = "kitty"
local filemanager = "dolphin"
local menu = "ulauncher-toggle"
local lock = "1password --lock & loginctl lock-session"
local browser = "brave"

local M = {
  terminal = terminal,
  filemanager = filemanager,
  menu = menu,
  lock = lock,
  mainMod = "SUPER",
  browser = browser,

  opQuickAccess = "1password --quick-access",
  toggleBar = "killall -s SIGUSR1 waybar",

  screenshot = {
    region = "slurp | grim -g - - | swappy -f - -o - | wl-copy",
    window = "hyprshot -z -m window --clipboard-only",
  },
  volControls = {
    up5 = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+",
    down5 = "set-volume @DEFAULT_AUDIO_SINK@ 5%-",
    up1 = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+",
    down1 = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-",
    mute = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0",
  },
  brightness = {
    up = "brightnessctl s 10%+",
    down = "brightnessctl s 10%-",
  },
  playerctl = {
    toggle = "playerctl play-pause",
    next = "playerctl next",
    prev = "playerctl prev",
  },
}

return M
