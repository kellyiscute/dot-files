local commands = require("commands")

local vimMotions = {
  H = "l",
  L = "r",
  K = "u",
  J = "d"
}

--- Return a key def with main mod
---@param ... string
---@return string
function m(...)
  local result = commands.mainMod
  local s = {...}

  for _, v in pairs(s) do
    result = result .. " + " .. v
  end
  return commands.mainMod .. ...
end

--- Return a key def with main mod + SHIFT
---@param ... string
---@return string
function ms(...)
  return m("SHIFT", ...)
end

-- session
hl.bind(ms("E"), hl.dsp.exec_cmd("uwsm stop"))
-- lock
hl.bind(m("ALT", "L"), function ()
  hl.exec_cmd(commands.lock)
  hl.timer(function ()
    hl.dispatch(hl.dsp.dpms({ action = "disable" }))
  end, { timeout = 1500, type = "oneshot" })
end)

-- apps
hl.bind(m("Return"), hl.dsp.exec_cmd(commands.terminal))
hl.bind(m("D"), hl.dsp.exec_cmd(commands.filemanager))
hl.bind(m("Space"), hl.dsp.exec_cmd(commands.menu))
hl.bind(ms("Space"), hl.dsp.exec_cmd(commands.opQuickAccess))
hl.bind(m("B"), hl.dsp.exec_cmd(commands.browser))

--#region windows
-- actions
hl.bind(ms("Q"), hl.dsp.window.kill())
hl.bind(ms("F"), hl.dsp.window.float())
hl.bind(m("TAB"), hl.dsp.window.cycle_next())

-- moving focus
for key, direction in pairs(vimMotions) do
  hl.bind(m(key), hl.dsp.focus({ direction = direction }))
end

-- moving windows
for key, direction in pairs(vimMotions) do
  hl.bind(ms(key), hl.dsp.window.move({ direction = direction }))
end

-- fullscreen
hl.bind("F11", hl.dsp.window.fullscreen())

-- moving with mouse
hl.bind("mouse:272", hl.dsp.window.drag(), { mouse = true })
-- resizing with mouse
hl.bind("mouse:273", hl.dsp.window.resize(), { mouse = true })
--#endregion

--#region workspaces
-- moving focus
for i = 1, 10, 1 do
hl.bind(m(tostring(i % 10)), hl.dsp.focus({ workspace = i }))
end

-- moving windows
for i = 1, 10, 1 do
hl.bind(ms(tostring(i % 10)), hl.dsp.window.move({ workspace = i }))
end

-- special workspaces
-- scratch pad
hl.bind(m("DELETE"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(ms("DELETE"), hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(m("i"), hl.dsp.workspace.toggle_special({ workspace = "im" }))
hl.bind(ms("i"), hl.dsp.window.move({ workspace = "special:im" }))

hl.bind(m("t"), hl.dsp.workspace.toggle_special("email"))
--#endregion

-- screenshot
hl.bind(ms("a"), hl.dsp.exec_cmd(commands.screenshot.region))
hl.bind(ms("s"), hl.dsp.exec_cmd(commands.screenshot.window))

-- brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(commands.brightness.up))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(commands.brightness.down))

-- volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(commands.volControls.up5))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(commands.volControls.down5))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(commands.volControls.mute))
hl.bind(m("mouse_down"), hl.dsp.exec_cmd(commands.volControls.up1))
hl.bind(m("mouse_up"), hl.dsp.exec_cmd(commands.volControls.down1))

-- player
hl.bind(m("p"), hl.dsp.exec_cmd(commands.playerctl.toggle))
hl.bind(m("XF86AudioPlay"), hl.dsp.exec_cmd(commands.playerctl.toggle))
hl.bind(m("comma"), hl.dsp.exec_cmd(commands.playerctl.prev))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(commands.playerctl.prev))
hl.bind(m("period"), hl.dsp.exec_cmd(commands.playerctl.next))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(commands.playerctl.next))
