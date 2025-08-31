vim.pack.add({
	-- dependencies
	"https://github.com/nvim-tree/nvim-web-devicons",

	"https://github.com/romgrk/barbar.nvim",
})

local barbar = require("barbar")
local map = vim.keymap.set

barbar.setup({
	auto_hide = false,
	focus_on_close = "previous", -- Focus the previous buffer when closing the current one
	sidebar_filetypes = {
		["neo-tree"] = true, -- Recognize Neo-tree as a sidebar
	},
})

map("n", "<S-h>", "<CMD>BufferPrevious<CR>")
map("n", "<S-l>", "<CMD>BufferNext<CR>")
map("n", "<leader>bo", "<CMD>BufferCloseAllButCurrent<CR>", { desc = "Close others" })
map("n", "<leader>bd", "<CMD>BufferClose<CR>", { desc = "Close current buffer" })
map("n", "<leader>bp", "<CMD>BufferPick<CR>", { desc = "Pick buffer" })

-- Save the last opened buffer ids then we can back to that easily
local last_opened_buf_id = {}
vim.api.nvim_create_autocmd("BufLeave", {
	callback = function()
		table.insert(last_opened_buf_id, 1, vim.api.nvim_get_current_buf())
	end,
})

map("n", "<leader>bb", function()
	-- back to last opened buffer
	for _, id in ipairs(last_opened_buf_id) do
		if vim.api.nvim_buf_is_valid(id) and id ~= vim.api.nvim_get_current_buf() then
			vim.api.nvim_set_current_buf(id)
		end
	end
end, { desc = "Back to last opened buffer" })
