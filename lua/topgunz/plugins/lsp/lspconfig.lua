return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.diagnostic.config({
				signs = {
					text = icon,
					linehl = hl,
					numhl = "",
				},
			})
		end

		vim.lsp.config["luals"] = {
			-- Command and arguments to start the server.
			cmd = { "lua-language-server" },
			-- Filetypes to automatically attach to.
			filetypes = { "lua" },
			-- Sets the "root directory" to the parent directory of the file in the
			-- current buffer that contains either a ".luarc.json" or a
			-- ".luarc.jsonc" file. Files that share a root directory will reuse
			-- the connection to the same LSP server.
			-- Nested lists indicate equal priority, see |vim.lsp.Config|.
			root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
			-- Specific settings to send to the server. The schema for this is
			-- defined by the server. For example the schema for lua-language-server
			-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}

		-- vim.lsp.config["jdtls"] = {
		-- 	opts = {},
		-- }

		vim.lsp.config("jdtls", {
			opts = {},
		})

		-- vim.lsp.config["gopls"] = {
		-- 	cmd = { "gopls" },
		-- 	filetypes = { "go", "gomod", "gowork", "gotmpl" },
		-- }
		--
		vim.lsp.config("gopls", {
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
		})
		-- vim.lsp.config["rust_analyzer"] = {
		-- 	filetypes = { "rust" },
		-- 	opts = {
		-- 		capabilities = capabilities,
		-- 	},
		-- }
		--
		vim.lsp.config("rust_analyzer", {
			filetypes = { "rust" },
			opts = {
				capabilities = capabilities,
			},
		})

		vim.lsp.config["ts_ls"] = {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		}
	end,
}
