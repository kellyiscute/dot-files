return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function(_, opts)
      local ts = require("nvim-treesitter")
      ts.install(opts.ensure_installed)
    end,
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
      ensure_installed = {
        "javascript", "typescript", "json", "toml", "vim", "go", "html", "lua", "json", "yaml",
        "qmljs", "dart", "css", "scss", "fish", "bash", "zsh", "dockerfile", "vimdoc", "jsdoc", "java", "kotlin",
        "hyprlang",
        "nginx", "ini", "c", "cpp", "c_sharp", "caddy", "make", "markdown", "markdown_inline", "regex", "latex", "csv",
        "dart", "desktop", "gitcommit", "gitignore", "gomod", "gosum", "gotmpl", "http", "json5", "jinja", "jq", "python",
        "rust", "sql", "sway", "terraform", "tsx", "xml", "vue", "mermaid", "kitty", "helm", "graphql",
        "norg", "typst", "svelte"
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = function()
      vim.g.no_plugin_maps = true
    end,
    opts = {
      lookahead = true,
    },
  }
}
