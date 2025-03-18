return {

	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",

	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_update_on_event = true,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
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
}
