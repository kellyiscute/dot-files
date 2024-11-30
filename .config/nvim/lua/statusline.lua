local player_exists = false;

local function player()
  local status = vim.system({ "playerctl", "-p", "spotify", "status" }, { text = true }):wait()
  local title = vim.system({ "playerctl", "-p", "spotify", "metadata", "title" }, { text = true }):wait()

  player_exists = status['stdout'] ~= ''

  local s = status['stdout'] == "Playing\n" and "" or ""
  local t = title['stdout']:gsub("\n", "")

  if (player_exists == false) then
    return " No player found "
  end

  return s .. " " .. t
end

local function next_button()
  if (player_exists) then
    return " "
  else
    return ""
  end
end
local function previous_button()
  if (player_exists) then
    return ""
  else
    return ""
  end
end

require("lualine").setup {
  options = {
    disabled_filetypes = {
      statusline = { "no-neck-pain" },
    },
    -- NOTE: global status has performance issues
    -- globalstatus = true,
  },
  extensions = { "neo-tree", "nvim-dap-ui" },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "diagnostics" },
    lualine_y = {
      {
        previous_button,
        separator = " ",
        on_click = function ()
          vim.cmd("silent !playerctl -p spotify previous")
        end,
      },
      {
        player,
        on_click = function ()
          vim.cmd("silent !playerctl -p spotify play-pause")
        end,
        padding = { right = 0 },
        separator = "",
      },
      {
        next_button,
        separator = " ",
        on_click = function ()
          vim.cmd("silent !playerctl -p spotify next")
        end
      },
    },
    lualine_z = { "location" }
  },
}
