vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

local snacks = require("snacks")
snacks.setup({
	input = { enabled = true }, -- Explicitly enable the input module
	scroll = { enabled = true }, -- Enable the scroll module
	notifier = { enabled = true },
	terminal = { enabled = true },
	picker = {
		win = {
			input = {
				keys = {
					["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
					["<Tab>"] = { "list_down", mode = { "i", "n" } },
				},
			},
		},
		list = {
			keys = {
				["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
				["<Tab>"] = { "list_down", mode = { "i", "n" } },
			},
		},
	},
})

local map = vim.keymap.set

map("n", "<C-'>", snacks.terminal.toggle, { desc = "Toggle terminal" })
