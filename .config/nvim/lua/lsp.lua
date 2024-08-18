require("mason").setup()
require("mason-lspconfig").setup()

local navic = require("navic");
local null_ls = require("null-ls")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

null_ls.setup {
  sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
  },
}

require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      init_options = {
        preferences = {
          ["typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets"] = true,
          ["typescript.format.insertSpaceAfterOpeningAndBeforeClosingEmptyBraces"] = true,
          ["typescript.format.insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces"] = true,
          ["typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces"] = true,
        }
      },
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end,
    }
  end,

  ["null-ls"] = null_ls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
                augroup LspFormatting
                    autocmd! * <buffer>
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                augroup END
            ]])
        end
    end,
  }),

}

-- dart language server
require("lspconfig").dartls.setup {
  capabilities = capabilities,
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
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
  end
}
