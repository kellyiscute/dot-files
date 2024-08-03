local function fuck()
  return [[fuck]]
end

require("lualine").setup {
  extensions = { "neo-tree", "nvim-dap-ui" },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "diagnostics" },
    lualine_y = { fuck },
    lualine_z = { "location" }
  },
}
