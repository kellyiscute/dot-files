-- Disable blur and shadow for popups
hl.window_rule({
  match = {
    class = "^()$",
  },
  no_blur = true,
  no_shadow = true,
})

hl.window_rule({
  name = "ulauncher-main",
  match = {
    class = "^(ulauncher)$",
    title = "^(Ulauncher - Application Launcher)$",
  },

  border_size = 0,
  no_shadow = true,
  no_blur = true,
  dim_around = true,
  stay_focused = true,
})

hl.window_rule({
  name = "ulauncher-prefs",
  match = {
    class = "^(ulauncher)$",
    title = "^(Ulauncher Preferences)$",
  },

  float = true,
  no_blur = true,
  no_shadow = true,
  border_size = 0,
})

hl.window_rule({
  name = "vlc-open",
  match = {
    class = "^(vlc)$",
    title = "(o|O)pen",
  },
  
  min_size = { 1200, 800 },
  center = true,
})

-- WeChat
hl.window_rule({
  name = "wechat-window",
  match = {
    initial_class = "^(wechat)$",
  },
  
  float = true,
  no_blur = true,
  border_size = 0,
  decorate = false,
})

-- QQ
hl.window_rule({
  name = "qq-window",
  match = {
    class = "^(QQ)$",
  },
  
  float = true,
  size = { 1200, 800 },
  center = true,
})

-- Brave login windows
hl.window_rule({
  name = "brave-login",
  match = {
    class = "^(brave-browser)$",
    title = ".*((S|s)ign\\s?in|log\\s?in).*",
  },
  
  float = true,
  min_size = { 400, 600 },
  center = true,
})

-- Telegram on workspace 1
hl.window_rule({
  name = "telegram-ws1",
  match = {
    class = "^(org\\.telegram\\.desktop)$",
    workspace = 1,
    float = true,
    initial_title = "^(Telegram).*",
  },
  
  float = true,
  min_size = { 410, 580 },
  max_size = { 430, 800 },
})

-- Telegram media viewer
hl.window_rule({
  name = "telegram-media",
  match = {
    class = "^(org\\.telegram\\.desktop)$",
    title = ".*Media viewer.*",
  },
  
  float = true,
})

-- PavuControl
hl.window_rule({
  name = "pavucontrol-window",
  match = {
    initial_class = "^(org\\.pulseaudio\\.pavucontrol)$",
  },
  
  float = true,
  min_size = { 500, 800 },
  max_size = { 800, 1000 },
})

-- Blueman Manager
hl.window_rule({
  name = "blueman-window",
  match = {
    initial_class = "^(blueman-manager)$",
  },
  
  float = true,
  min_size = { 200, 600 },
  max_size = { 600, 800 },
})

-- 1Password quick access
hl.window_rule({
  name = "onepassword-quick",
  match = {
    title = "^(Quick Access — 1Password)$",
  },
  
  dim_around = true,
  stay_focused = true,
})

-- kitty-tmp
hl.window_rule({
  name = "kitty-tmp",
  match = {
    class = "^(kitty-tmp)$",
  },
  
  float = true,
  center = true,
  dim_around = true,
  size = { 600, 400 },
})
