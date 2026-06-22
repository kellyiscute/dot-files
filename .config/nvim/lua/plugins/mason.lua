local capabilities = require("cmp_nvim_lsp").default_capabilities()

local tsls_conf = {
  init_options = {
    maxTsServerMemory = 20480,
    preferences = {
      typescript = {
        format = {
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
          insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
        },
        inlayHints = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = true,
          includeInlayVariableTypeHints = true,
        },
        enablePromptUseWorkspaceTsdk = true,
      },
    },
  }
}

local dartls_conf = {
  capabilities = capabilities,
  cmd = { "dart", "language-server", "--lsp" },
  filetypes = { "dart" },
  root_markers = { "pubspec.yaml", "analysis_options.yaml", ".dartignore", ".git" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end,
}

local yamlls_conf = {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
        "docker-compose*.yml",
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
        ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
        "workflows/*.yaml",
        kubernetes = {
          "**/templates/*.yaml",
          "**/templates/*.yml",
          "charts/*/templates/*.yaml",
          "charts/*/templates/*.yml",
          "*.k8s.yaml",
        },
      },
    },
  }
}

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = true,
    ensure_installed = {
      "ts_ls",
      "cssls",
      "buf_ls",
      "cspell_ls",
      "fish_lsp",
      "eslint",
      "gopls",
      "hyprls",
      "jsonls",
      "lua_ls",
      "qmlls",
      "vimls",
      "yamlls",
      "tombi",
      "rust_analyzer",
      "docker_compose_language_service",
      "docker_language_server",
      "bashls",
      "omnisharp",
      "basedpyright",
      "denols",
      "emmet_ls",
      "home_assistant",
      "systemd_lsp",
    },
  },
  init = function()
    vim.lsp.config("ts_ls", tsls_conf)
    vim.lsp.config("yamlls", yamlls_conf)
    vim.lsp.config("dartls", dartls_conf)
    vim.lsp.enable("dartls")
  end,
  dependencies = {
    "neovim/nvim-lspconfig",
    {
      "mason-org/mason.nvim",
      opts = {
        firewall = {
          enabled = true,
        },
      },
    },
  },
}
