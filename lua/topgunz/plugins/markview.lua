return {
	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	lazy = false,

	-- 	-- For blink.cmp's completion
	-- 	-- source
	-- 	-- dependencies = {
	-- 	--     "saghen/blink.cmp"
	-- 	-- },
	-- },
	--	{
	--		"iamcco/markdown-preview.nvim",
	--		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	--		build = "cd app && yarn install",
	--		init = function()
	--			vim.g.mkdp_filetypes = { "markdown" }
	--		end,
	--		ft = { "markdown" },
	--	},
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{ "kylef/apiblueprint.vim" },
}
