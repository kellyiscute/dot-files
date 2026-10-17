require("mason").setup()
require("mason-lspconfig").setup()

local navic = require("navic")
local null_ls = require("null-ls")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
	},
})

require("mason-lspconfig").setup({
  automatic_enable = true,
	-- handlers = {
	-- 	function(server_name)
	-- 		local opts = {
	-- 			capabilities = capabilities,
	-- 			on_attach = function(client, bufnr)
	-- 				if client.server_capabilities.documentSymbolProvider then
	-- 					navic.attach(client, bufnr)
	-- 				end
	-- 			end,
	-- 		}

	-- 		if server_name == "ts_ls" then
	-- 			opts.init_options = {
	-- 				maxTsServerMemory = 10240,
	-- 				preferences = {
	-- 					typescript = {
	-- 						format = {
	-- 							insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
	-- 							insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
	-- 							insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
	-- 							insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
	-- 						},
	-- 						inlayHints = {
	-- 							parameterNames = { enabled = true },
	-- 						},
	-- 						enablePromptUseWorkspaceTsdk = true,
	-- 					},
	-- 				},
	-- 			}
	-- 		elseif server_name == "yamlls" then
	-- 			opts.settings = 
	-- 		end

	-- 		require("lspconfig")[server_name].setup(opts)
	-- 	end,
	-- },
})

vim.lsp.config("ts_ls", {
  init_options = {
		maxTsServerMemory = 10240,
		preferences = {
			typescript = {
				format = {
					insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
					insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
					insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
					insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
				},
				inlayHints = {
					parameterNames = { enabled = true },
				},
				enablePromptUseWorkspaceTsdk = true,
			},
		},
	}
});

vim.lsp.config("yamlls", {
  settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
				["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
				["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "workflows/*.yaml",
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
});

-- dart language server
vim.lsp.config("dartls", {
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
	end,
})
