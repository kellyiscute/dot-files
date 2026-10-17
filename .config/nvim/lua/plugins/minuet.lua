return {
	"milanglacier/minuet-ai.nvim",
	lazy = false,
  enabled = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		provider = "openai_fim_compatible",
		n_completions = 1, -- local model: keep requests cheap
		context_window = 1024,
		provider_options = {
			openai_fim_compatible = {
				api_key = "TERM", -- Ollama ignores the key, but minuet needs a non-empty env var
				name = "Ollama",
				end_point = "http://localhost:11434/v1/completions",
				model = "qwen2.5-coder:7b",
				optional = {
					max_tokens = 56,
					top_p = 0.9,
				},
			},
		},
		virtualtext = {
			auto_trigger_ft = { "*" },
			auto_trigger_ignore_ft = { "TelescopePrompt", "snacks_picker_input", "neo-tree", "gitcommit" },
			-- <Tab> / <S-Tab> accept are mapped in `config` so they fall back when no suggestion is shown
			keymap = {
				accept_n_lines = "<A-z>",
				prev = "<A-[>",
				next = "<A-]>",
				dismiss = "<A-e>",
			},
		},
	},
	config = function(_, opts)
		require("minuet").setup(opts)

		-- Ollama loads a model into VRAM on first request; warm it up now so the first suggestion is fast
		local fim = opts.provider_options.openai_fim_compatible
		vim.system({
			"curl", "-s", "-m", "60", "http://localhost:11434/api/generate",
			"-d", vim.json.encode({ model = fim.model, keep_alive = "30m" }),
		})

		local vt = require("minuet.virtualtext").action
		local function accept_or(action, key)
			return function()
				if vt.is_visible() then
					action()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, false, true), "n", false)
				end
			end
		end

		vim.keymap.set("i", "<Tab>", accept_or(vt.accept, "<Tab>"), { desc = "[minuet] accept suggestion" })
		vim.keymap.set("i", "<S-Tab>", accept_or(vt.accept_line, "<S-Tab>"), { desc = "[minuet] accept line" })
	end,
}
