return {
	{
		"rmagatti/auto-session",
		config = function()
			local auto_session = require("auto-session")

			auto_session.setup({
				auto_restore_enabled = false,
				auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
			})

			local keymap = vim.keymap

			keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
			keymap.set(
				"n",
				"<leader>ws",
				"<cmd>SessionSave<CR>",
				{ desc = "Save session for auto session root diretory" }
			)
		end,
	},
	{
		"forest-nvim/maple.nvim",
		config = function()
			require("maple").setup({
				-- Appearance
				width = 0.8, -- Width of the popup (ratio of the editor width)
				height = 0.8, -- Height of the popup (ratio of the editor height)
				border = "rounded", -- Border style ('none', 'single', 'double', 'rounded', etc.)
				title = " Maple Note ",
				title_pos = "left",
				winblend = 10, -- Window transparency (0-100)
				show_legend = false, -- Whether to show keybind legend in the UI

				-- Storage
				storage_path = vim.fn.stdpath("data") .. "/maple",

				-- Notes management
				notes_mode = "project", -- "global" or "project"
				use_project_specific_notes = true, -- Store notes by project

				-- Keymaps (set to nil to disable)
				keymaps = {
					toggle = "<leader>m", -- Key to toggle Maple
					close = "q", -- Key to close the window
					switch_mode = "m", -- Key to switch between global and project view
				},
			})
		end,
	},
	{
		"alex-popov-tech/store.nvim",
		dependencies = {
			"OXY2DEV/markview.nvim", -- optional, for pretty readme preview / help window
		},
		cmd = "Store",
		keys = {
			{ "<leader>s", "<cmd>Store<cr>", desc = "Open Plugin Store" },
		},
		opts = {
			-- optional configuration here
		},
	},
}
