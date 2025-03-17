vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })

keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })

keymap.set("n", "<leader>dus", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end, { desc = "Open debugging sidebar" })

keymap.set("n", "<leader>dbg", function()
	require("dap-go").debug_test()
end, { desc = "Debug go test" })

keymap.set("n", "<leader>dbgl", function()
	require("dap-go").debug_last_test()
end, { desc = "Debug last go test" })
