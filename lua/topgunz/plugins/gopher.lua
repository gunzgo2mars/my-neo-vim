return {
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
}
