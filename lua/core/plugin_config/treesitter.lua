require("nvim-treesitter.configs").setup {
	ensure_installed = {"lua", "python", "javascript", "html", "css", "vim", "vimdoc", "query", "c"},
	highlight = {
		enable = true
	},

	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Leader>ss",
			node_incremental = "<Leader>si",
			scope_incremental = "<Leader>sc",
			node_decremental = "<Leader>sd",
		},
	}
}
