local player_exists = false

local function player()
	local status = vim.system({ "playerctl", "-p", "mpd", "status" }, { text = true }):wait()
	local title = vim.system({ "playerctl", "-p", "mpd", "metadata", "title" }, { text = true }):wait()

	player_exists = status["stdout"] ~= ""

	local s = status["stdout"] == "Playing\n" and "" or ""
	local t = title["stdout"]:gsub("\n", "")

	if player_exists == false then
		return " No player found "
	end

	return s .. " " .. t
end

local function next_button()
	if player_exists then
		return " "
	else
		return ""
	end
end
local function previous_button()
	if player_exists then
		return ""
	else
		return ""
	end
end

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			disabled_filetypes = {
				statusline = {},
			},
		},
		extensions = { "neo-tree" },
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "filename" },
			lualine_x = { "diagnostics" },
			lualine_y = {
				{
					previous_button,
					separator = " ",
					on_click = function()
						vim.cmd("silent !playerctl -p mpd previous")
					end,
				},
				{
					player,
					on_click = function()
						vim.cmd("silent !playerctl -p mpd play-pause")
					end,
					padding = { right = 0 },
					separator = "",
				},
				{
					next_button,
					separator = " ",
					on_click = function()
						vim.cmd("silent !playerctl -p mpd next")
					end,
				},
			},
			lualine_z = { "location" },
		},
	},
}
