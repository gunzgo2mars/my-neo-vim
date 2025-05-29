return {

	"nvim-telescope/telescope.nvim",
	 branch = "0.1.x",
	 dependencies = {
	 	"nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-live-grep-args.nvim" },
	 	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	 	"nvim-tree/nvim-web-devicons",
	 },

	 config = function()
	 	local telescope = require("telescope")
	 	local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
	 	telescope.setup({
	 		defaults = {
	 			path_display = { "smart" },
	 			mappings = {
	 				i = {
	 					["<C-k>"] = actions.move_selection_previous,
	 					["<C-j>"] = actions.move_selection_next,
	 					["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
	 				},
	 			},
	 		},

extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          -- freeze the current list and start a fuzzy search in the frozen list
          ["<C-space>"] = lga_actions.to_fuzzy_refine,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
	 	})

    telescope.load_extension("live_grep_args")
	 	telescope.load_extension("fzf")
	 	local keymap = vim.keymap

	 	-- TODO: Keymaps
	 	keymap.set(
	 		"n",
	 		"<leader>ff",
	 		"<cmd>lua require('telescope.builtin').find_files()<cr>",
	 		{ desc = "Fuzzy find files in cwd" }
	 	)
	 	keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent file" })
	 	keymap.set(
	 		"n",
	 		"<leader>fs",
	 		"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
	 		{ desc = "Find string in cwd" }
	 	)
	 	keymap.set(
	 		"n",
	 		"<leader>fc",
	 		"<cmd>lua require('telescope.builtin').grep_string()<cr>",
	 		{ desc = "Find string under cursor in cwd" }
	 	)

    keymap.set(
      "n",
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      { desc = "Find buffer recent file"}
    )

	  keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.8",
	-- 	-- or                              , branch = '0.1.x',
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		local keymap = vim.keymap
	-- 		keymap.set(
	-- 			"n",
	-- 			"<leader>ff",
	-- 			"<cmd>lua require('telescope.builtin').find_files()<cr>",
	-- 			{ desc = "Fuzzy find files in cwd" }
	-- 		)
	-- 		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent file" })
	-- 		keymap.set(
	-- 			"n",
	-- 			"<leader>fs",
	-- 			"<cmd>lau require('telescope.builtin').live_grep()<cr>",
	-- 			{ desc = "Find string in cwd" }
	-- 		)
	-- 		keymap.set(
	-- 			"n",
	-- 			"<leader>fc",
	-- 			"<cmd>lua require('telescope.builtin').grep_string()<cr>",
	-- 			{ desc = "Find string under cursor in cwd" }
	-- 		)
	-- 	end,
	-- },
}
