vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
})

local lint = require("lint")

lint.linters_by_ft = {
	-- JavaScript/TypeScript/Vue
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	vue = { "eslint_d" },
	-- CSS
	css = { "stylelint" },
	scss = { "stylelint" },
}

function Debounce(ms, fn)
	local timer = vim.uv.new_timer()
	return function(...)
		local argv = { ... }

		if not timer then
			return
		end

		timer:start(ms, 0, function()
			timer:stop()
			vim.schedule_wrap(fn)(unpack(argv))
		end)
	end
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
	callback = function()
		Debounce(100, function()
			lint.try_lint()
		end)()
	end,
})
