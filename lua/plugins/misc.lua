vim.pack.add({
	-- mini
	{ src = "https://github.com/echasnovski/mini.bracketed", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.hipatterns", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.icons", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.indentscope", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.notify", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.pairs", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.statusline", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.surround", version = "stable" },
	-- other
	"https://github.com/gbprod/cutlass.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/lukas-reineke/virt-column.nvim",
})

-- set colorscheme
vim.cmd([[colorscheme tokyonight-night]])

-- mini
require("mini.bracketed").setup()
require("mini.hipatterns").setup()
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()
require("mini.surround").setup()

-- other
require("cutlass").setup({ cut_key = "x" })
require("nvim-ts-autotag").setup()
require("todo-comments").setup()

require("virt-column").setup()
