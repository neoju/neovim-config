vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")
local map = vim.keymap.set

conform.setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end

		return {
			timeout_ms = 500,
			lsp_format = "fallback",
		}
	end,

	formatters_by_ft = {
		-- JavaScript/TypeScript
		javascript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		vue = { "prettierd", "prettier" },
		-- CSS/SCSS
		css = { "prettierd", "prettier" },
		scss = { "prettierd", "prettier" },
		less = { "prettierd", "prettier" },
		-- JSON/YAML
		json = { "prettierd", "prettier" },
		jsonc = { "prettierd", "prettier" },
		yaml = { "prettierd", "prettier" },
		-- Markdown/HTML
		markdown = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		-- Other formats
		lua = { "stylua" },
		python = { "black" },
		go = { "goimports", "gofumpt" },
	},
})

map("n", "<leader>cF", function()
	local notify_id = MiniNotify.add("Autoformatting " .. (vim.g.disable_autoformat and "enabled" or "disabled"))

	vim.defer_fn(function()
		MiniNotify.remove(notify_id)
	end, 1000)

	vim.g.disable_autoformat = not vim.g.disable_autoformat
end, { desc = "Toggle Autoformatting" })
