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
	"https://gitlab.com/bartekjaszczak/luma-nvim",

	priority = 1000,
	config = function()
		require("luma").setup({
			theme = "dark", -- "dark" or "light" theme
			contrast = "high", -- "low", "medium" or "high" contrast
		})

		-- Activate the theme
		vim.cmd.colorscheme("luma")
	end,
}

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
