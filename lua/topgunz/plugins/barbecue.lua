return {
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
}
