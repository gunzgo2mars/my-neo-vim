return {

	"tiagovla/tokyodark.nvim",
	priority = 1000,
	config = function()
		vim.o.background = "dark"
		vim.cmd("colorscheme tokyodark")
	end,
}
