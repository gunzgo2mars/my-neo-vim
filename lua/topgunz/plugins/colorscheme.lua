-- return {
-- 	"sekke276/dark_flat.nvim",
-- 	-- make sure to load this before all the other start plugins
-- 	config = function()
-- 		require("dark_flat").setup({
--
-- 			transparent = false, -- enable transparent window
-- 		})
--
-- 		vim.cmd("colorscheme dark_flat")
-- 	end,
-- }
--

return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "dragon", -- Load "wave" theme
			background = { -- map the value of 'background' option to a theme
				dark = "dragon", -- try "dragon" !
				light = "lotus",
			},
		})
		vim.cmd("colorscheme kanagawa")
	end,
}

-- return {
-- 	"https://gitlab.com/bartekjaszczak/luma-nvim",
--
-- 	priority = 1000,
-- 	config = function()
-- 		require("luma").setup({
-- 			theme = "dark", -- "dark" or "light" theme
-- 			contrast = "high", -- "low", "medium" or "high" contrast
-- 		})
--
-- 		-- Activate the theme
-- 		vim.cmd.colorscheme("luma")
-- 	end,
-- }

-- return {
-- 	"uloco/bluloco.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	dependencies = { "rktjmp/lush.nvim" },
-- 	config = function()
-- 		-- your optional config goes here, see below.
-- 		require("bluloco").setup({
-- 			style = "dark", -- "auto" | "dark" | "light"
-- 			transparent = false,
-- 			italics = false,
-- 			terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
-- 			guicursor = true,
-- 		})
--
-- 		vim.opt.termguicolors = true
-- 		vim.cmd("colorscheme bluloco")
-- 	end,
-- }

-- return {
-- 	"samharju/synthweave.nvim",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000,
-- 	config = function()
-- 		local synthweave = require("synthweave")
-- 		synthweave.setup({
-- 			transparent = false,
-- 			overrides = {
-- 				-- override any group
-- 				Identifier = { fg = "#f22f52" },
-- 			},
-- 			palette = {
-- 				-- override palette colors, take a peek at synthweave/palette.lua
-- 				bg0 = "#040404",
-- 			},
-- 		})
-- 		synthweave.load()
-- 		vim.cmd.colorscheme("synthweave")
-- 	end,
-- }
