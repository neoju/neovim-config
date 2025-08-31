vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<C-s>", "<CMD>write<CR>", { desc = "Save" })
map("n", "<leader>qq", "<CMD>quitall<CR>", { desc = "Quit all" })

-- Clear search highlight
map("n", "<ESC>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Move Lines
-- NOTE: The following keymaps work fine with most terminal emulators except ghostty.
local Aj = "<A-j>"
local Ak = "<A-k>"
-- For the ghostty terminal:
Aj = "∆"
Ak = "˚"
map("n", Aj, "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", Ak, "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", Aj, "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", Ak, "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", Aj, ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", Ak, ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Jump between windows using Ctrl + hjkl
map("n", "<C-l>", "<CMD>wincmd l<CR>")
map("n", "<C-h>", "<CMD>wincmd h<CR>")
map("n", "<C-j>", "<CMD>wincmd j<CR>")
map("n", "<C-k>", "<CMD>wincmd k<CR>")

-- Set a custom keymap to update the window title
map("n", "<leader>wt", function()
	-- Prompt for title without blink.cmp interfering
	vim.ui.input({ prompt = "Enter window title: " }, function(title)
		-- Set the title, replacing spaces with hyphens
		if title and title ~= "" then
			vim.cmd("set titlestring=" .. title:gsub("%s+", "-"))
			vim.cmd("set title")
		end
	end)
end, { desc = "Set Window Title" })

-- LSP keymaps
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
map({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { desc = "LSP Code Action" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })

-- search and replace
map("n", "<leader>sS", function()
	require("grug-far").open({
		prefills = {
			search = vim.fn.expand("<cword>"),
		},
	})
end, { desc = "Search and Replace current word" })

map({ "n", "x" }, "<leader>ss", function()
	require("grug-far").open({
		prefills = {
			paths = vim.fn.expand("%"),
			search = vim.fn.expand("<cword>"),
		},
	})
end, { desc = "Search and Replace current word - in file" })

map({ "n", "x" }, "<leader>si", function()
	require("grug-far").open({ visualSelectionUsage = "operate-within-range" })
end, { desc = "Search and Replace within range" })
