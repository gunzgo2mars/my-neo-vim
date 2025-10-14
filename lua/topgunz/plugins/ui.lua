return {

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"fei6409/log-highlight.nvim",
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"b0o/incline.nvim",
		config = function()
			require("incline").setup()
		end,
		-- Optional: Lazy load Incline
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
	},

	-- color schema
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			compile = false, -- enable compiling the colorscheme
	-- 			undercurl = true, -- enable undercurls
	-- 			commentStyle = { italic = true },
	-- 			functionStyle = {},
	-- 			keywordStyle = { italic = true },
	-- 			statementStyle = { bold = true },
	-- 			typeStyle = {},
	-- 			transparent = false, -- do not set background color
	-- 			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	-- 			terminalColors = true, -- define vim.g.terminal_color_{0,17}
	-- 			colors = { -- add/modify theme and palette colors
	-- 				palette = {},
	-- 				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	-- 			},
	-- 			overrides = function(colors) -- add/modify highlights
	-- 				return {}
	-- 			end,
	-- 			theme = "dragon", -- Load "wave" theme
	-- 			background = { -- map the value of 'background' option to a theme
	-- 				dark = "dragon", -- try "dragon" !
	-- 				light = "lotus",
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme kanagawa")
	-- 	end,
	-- },
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",

		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					diagnostics_update_on_event = true,
					diagnostics_indicator = function(count, level, diagnostics_dict, _)
						local s = " "
						for e, n in pairs(diagnostics_dict) do
							local sym = e == "error" and " " or (e == "warning" and " " or " ")
							s = s .. n .. sym
						end

						return s
					end,
					mode = "tabs",
					separator_style = "thick",
					groups = {
						options = {
							toggle_hidden_on_enter = true,
						},
						items = {
							{
								auto_close = false,
								name = "Tests", -- Mandatory
								highlight = { underline = true, sp = "blue" }, -- Optional
								priority = 2, -- determines where it will appear relative to other groups (Optional)
								icon = " ", -- Optional
								matcher = function(buf) -- Mandatory
									return buf.filename:match("%_test") or buf.filename:match("%_spec")
								end,
							},
							{
								name = "Docs",
								highlight = { undercurl = true, sp = "green" },
								auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
								matcher = function(buf)
									return buf.filename:match("%.md") or buf.filename:match("%.txt")
								end,
								separator = { -- Optional
									style = require("bufferline.groups").separator.tab,
								},
							},
						},
					},
				},
			})
		end,
	},

	-- barbecue
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},

		config = function()
			require("barbecue").setup({
				theme = "luma-dark",
			})
		end,
	},

	-- lua line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status") -- to configure lazy pending updates count

			local colors = {
				blue = "#80a0ff",
				cyan = "#79dac8",
				black = "#080808",
				white = "#c6c6c6",
				red = "#ff5189",
				violet = "#d183e8",
				grey = "#303030",
			}

			local bubbles_theme = {
				normal = {
					a = { fg = colors.black, bg = colors.violet },
					b = { fg = colors.white, bg = colors.grey },
					c = { fg = colors.white },
				},

				insert = { a = { fg = colors.black, bg = colors.blue } },
				visual = { a = { fg = colors.black, bg = colors.cyan } },
				replace = { a = { fg = colors.black, bg = colors.red } },

				inactive = {
					a = { fg = colors.white, bg = colors.black },
					b = { fg = colors.white, bg = colors.black },
					c = { fg = colors.white },
				},
			}

			-- configure lualine with modified theme
			lualine.setup({

				options = {
					icons_enabled = true,
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = true,
					theme = "horizon",
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = { "filename", "branch" },
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
							color = { fg = "#ff9e64" },
						},
						{ "encoding" },
						{ "fileformat" },
						{ "filetype" },
					},
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
			})
		end,
	},
	{
		"OXY2DEV/ui.nvim",
		lazy = false,
		config = function()
			require("ui").setup({
				popupmenu = {
					enable = true,

					winconfig = {},
					tooltip = nil,

					styles = {
						default = {
							padding_left = " ",
							padding_right = " ",

							icon = nil,
							text = nil,

							normal_hl = nil,
							select_hl = "CursorLine",
							icon_hl = nil,
						},

						example = {
							condition = function()
								return true
							end,

							icon = "I ",
						},
					},
				},
				cmdline = {
					enable = true,

					styles = {
						default = {
							cursor = "Cursor",
							filetype = "vim",

							icon = { { "I ", "@comment" } },
							offset = 0,

							title = nil,
							winhl = "",
						},

						example = {
							condition = function()
								return true
							end,

							cursor = "@comment",
						},
					},
				},
				message = {
					enable = true,

					message_winconfig = {},
					list_winconfig = {},
					confirm_winconfig = {},
					history_winconfig = {},

					ignore = function()
						return false
					end,

					showcmd = {
						max_width = 10,
						modifier = nil,
					},

					msg_styles = {
						default = {
							duration = 500,

							modifier = nil,
							decorations = {
								icon = { { "I " } },
							},
						},

						example = {
							condition = function()
								return true
							end,

							decorations = {
								icon = { { "B " } },
							},
						},
					},

					is_list = function()
						return false
					end,

					list_styles = {
						default = {
							modifier = nil,

							row = nil,
							col = nil,

							width = nil,
							height = nil,

							winhl = nil,
						},

						example = {
							condition = function()
								return true
							end,

							border = "rounded",
						},
					},
					confirm_styles = {
						default = {
							modifier = nil,

							row = nil,
							col = nil,

							width = nil,
							height = nil,

							winhl = nil,
						},

						example = {
							condition = function()
								return true
							end,

							border = "rounded",
						},
					},
				},
			})
		end,
	},
}
