require("neo-tree").setup {
  open_on_setup = true,
  reveal_path = true,
  sources = {
    "filesystem",
    "git_status",
    "buffers",
    "document_symbols",
  },
  window = {
    mappings = {
      ["s"] = "open_split",
      ["E"] = "open_vsplit",
      ["l"] = "open",
      ["h"] = "close_node",
    },
    popup = {
      border = "rounded",
    },
  },
  document_symbols = {
    follow_cursor = true,
    client_filters = "first",
    renderers = {
      root = {
        {"indent"},
        {"icon", default="C" },
        {"name", zindex = 10},
      },
      symbol = {
        {"indent", with_expanders = true},
        {"kind_icon", default="?" },
        {"container",
        content = {
          {"name", zindex = 10},
          {"kind_name", zindex = 20, align = "right"},
          }
        }
      },
    },
  },
  filesystem = {
    follow_current_file = {
      enable = true,
      leave_dirs_open = true,
    },
  },
  buffers = {
    follow_current_file = {
      enable = true,
    },
  },
  source_selector = {
    winbar = true,
    sources = {
      {
        source = "filesystem",
        display_name = " 󰉓 Files ",
      },
      {
        source = "buffers",
        display_name = " 󰈚 Buffers ",
      },
      {
        source = "git_status",
        display_name = " 󰊢 Git ",
      },
      {
        source = "document_symbols",
        display_name = " 󰌵 Symbols ",
      },
    },
  },
}
