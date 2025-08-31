vim.pack.add({
	"https://github.com/chrisgrieser/nvim-origami",
})

require("origami").setup({
	autoFold = {
		enabled = true,
		kinds = {
			"comment",
			"imports",
		},
	},
	foldKeymaps = {
		setup = false,
	},
})
