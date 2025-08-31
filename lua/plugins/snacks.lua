vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

local snacks = require("snacks")
snacks.setup({
	input = { enabled = true }, -- Explicitly enable the input module
	scroll = { enabled = true }, -- Enable the scroll module
	notifier = { enabled = true },
	terminal = { enabled = true },
	indent = { enabled = true },
	scope = { enabled = true },
	scratch = { enabled = true },
	zen = { enabled = true },
	statuscolumn = { enabled = true },
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

map("n", "<C-'>", snacks.terminal.toggle, { desc = "Toggle Terminal" })

map("n", "<leader>.", function()
	snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })

map("n", "<leader>S", function()
	snacks.scratch.select()
end, { desc = "Toggle Scratch Buffer" })

map("n", "<leader>z", function()
	snacks.zen()
end, { desc = "Toggle zen mode" })
