vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.shiftwidth = 4

vim.opt.cursorline = true

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt["guicursor"] = "n-v-c:block-cursor"

vim.opt.splitright = true

vim.opt.termguicolors = true

vim.opt.undofile = true

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<Esc>',  '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.buffers , {})
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>nt', ":!start cd<CR>")

vim.keymap.set('n', '<c-p>',  ':bp<CR>')
vim.keymap.set('n', '<c-n>',  ':bn<CR>')
vim.keymap.set('n', '<c-F4>',  ':bd<CR>')

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)

local CopilotAsk = function ()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, {selection = require("CopilotChat.select").buffer})
	end
end

vim.keymap.set("n", "<leader>ccq", CopilotAsk)

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})
