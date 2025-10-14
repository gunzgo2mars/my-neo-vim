return {
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		opts = {
			focus = true,
		},
		cmd = "Trouble",
		keys = {
			{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Open trouble document diagnostics",
			},
			{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
			{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
			{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
		},
	},

	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = true,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				-- javascript = { "eslint_d" },
				-- typescript = { "eslint_d" },
				-- javascriptreact = { "eslint_d" },
				-- typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				python = { "pylint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},

	-- formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					svelte = { "prettier" },
					go = { "goimports", "gofmt" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },
					liquid = { "prettier" },
					lua = { "stylua" },
					python = { "isort", "black" },
					clang = { "clang-format" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},

	-- rust-lang tools
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
		["rust-analyzer"] = {
			cargo = {
				allFeature = true,
			},
		},
	},
	-- java tools
	{
		"nvim-java/nvim-java",
		config = function()
			require("java").setup()
		end,
	},

	-- golang tools
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
		},
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd.GoInstallDeps()
		end,
	},

	-- rust tools
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		opts = function() end,
	},

	-- cord
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		opts = {
			enabled = true,
			log_level = vim.log.levels.OFF,
			editor = {
				client = "neovim",
				tooltip = "The Superior Text Editor",
				icon = nil,
			},
			display = {
				theme = "default",
				flavor = "dark",
				view = "full",
				swap_fields = false,
				swap_icons = false,
			},
			timestamp = {
				enabled = true,
				reset_on_idle = false,
				reset_on_change = false,
				shared = false,
			},
			idle = {
				enabled = true,
				timeout = 300000,
				show_status = true,
				ignore_focus = true,
				unidle_on_focus = true,
				smart_idle = true,
				details = "Idling",
				state = nil,
				tooltip = "💤",
				icon = nil,
			},
			text = {
				default = nil,
				workspace = function(opts)
					return "In " .. opts.workspace
				end,
				viewing = function(opts)
					return "Viewing " .. opts.filename
				end,
				editing = function(opts)
					return "Editing " .. opts.filename
				end,
				file_browser = function(opts)
					return "Browsing files in " .. opts.name
				end,
				plugin_manager = function(opts)
					return "Managing plugins in " .. opts.name
				end,
				lsp = function(opts)
					return "Configuring LSP in " .. opts.name
				end,
				docs = function(opts)
					return "Reading " .. opts.name
				end,
				vcs = function(opts)
					return "Committing changes in " .. opts.name
				end,
				notes = function(opts)
					return "Taking notes in " .. opts.name
				end,
				debug = function(opts)
					return "Debugging in " .. opts.name
				end,
				test = function(opts)
					return "Testing in " .. opts.name
				end,
				diagnostics = function(opts)
					return "Fixing problems in " .. opts.name
				end,
				games = function(opts)
					return "Playing " .. opts.name
				end,
				terminal = function(opts)
					return "Running commands in " .. opts.name
				end,
				dashboard = "Home",
			},
			buttons = nil,
			-- buttons = {
			--   {
			--     label = 'View Repository',
			--     url = function(opts) return opts.repo_url end,
			--   },
			-- },
			assets = nil,
			variables = nil,
			hooks = {
				ready = nil,
				shutdown = nil,
				pre_activity = nil,
				post_activity = nil,
				idle_enter = nil,
				idle_leave = nil,
				workspace_change = nil,
				buf_enter = nil,
			},
			plugins = nil,
			advanced = {
				plugin = {
					autocmds = true,
					cursor_update = "on_hold",
					match_in_mappings = true,
				},
				server = {
					update = "fetch",
					pipe_path = nil,
					executable_path = nil,
					timeout = 300000,
				},
				discord = {
					pipe_paths = nil,
					reconnect = {
						enabled = false,
						interval = 5000,
						initial = true,
					},
				},
				workspace = {
					root_markers = {
						".git",
						".hg",
						".svn",
					},
					limit_to_cwd = false,
				},
			},
		},
	},

	-- git tools
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
		},
	},

	{
		"gbprod/substitute.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local substitute = require("substitute")

			substitute.setup()

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
			keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
			keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
			keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
		end,
	},

	-- terminal
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- autopair
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			-- import nvim-autopairs
			local autopairs = require("nvim-autopairs")

			-- configure autopairs
			autopairs.setup({
				check_ts = true, -- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
			})

			-- import nvim-autopairs completion functionality
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			-- import nvim-cmp plugin (completions plugin)
			local cmp = require("cmp")

			-- make autopairs and completion work together
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- debugger
	{
		"mfussenegger/nvim-dap",
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},

	-- Soil - plantuml preview
	{
		"javiorfo/nvim-soil",

		-- Optional for puml syntax highlighting:
		dependencies = { "javiorfo/nvim-nyctophilia" },

		lazy = true,
		ft = "plantuml",
		opts = {
			-- If you want to change default configurations

			-- This option closes the image viewer and reopen the image generated
			-- When true this offers some kind of online updating (like plantuml web server)
			actions = {
				redraw = false,
			},

			-- If you want to use Plant UML jar version instead of the installed version
			puml_jar = "/path/to/plantuml.jar",

			-- If you want to customize the image showed when running this plugin
			image = {
				darkmode = false, -- Enable or disable darkmode
				format = "png", -- Choose between png or svg

				-- This is a default implementation of using nsxiv to open the resultant image
				-- Edit the string to use your preferred app to open the image (as if it were a command line)
				-- Some examples:
				-- return "feh " .. img
				-- return "xdg-open " .. img
				execute_to_open = function(img)
					return "nsxiv -b " .. img
				end,
			},
		},
	},

	-- Live preview markdown & html
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			-- You can choose one of the following pickers
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
			"echasnovski/mini.pick",
		},
	},
}
