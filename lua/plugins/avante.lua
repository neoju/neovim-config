vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/hakonharnes/img-clip.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",

	{ src = "https://github.com/yetone/avante.nvim" },
})

require("render-markdown").setup({
	file_types = { "markdown", "Avante" },
	completions = { blink = { enabled = true } },
})

require("img-clip").setup({
	default = {
		embed_image_as_base64 = false,
		prompt_for_file_name = false,
		drag_and_drop = {
			insert_mode = true,
		},
		-- required for Windows users
		use_absolute_path = true,
	},
})

require("avante").setup({
	-- Your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	provider = "gemini-2.5-pro",
	input = {
		provider = "snacks", -- "native" | "dressing" | "snacks"
		provider_opts = {
			-- Snacks input configuration
			title = "Avante Input",
			icon = " ",
			placeholder = "Enter your API key...",
		},
	},
})
