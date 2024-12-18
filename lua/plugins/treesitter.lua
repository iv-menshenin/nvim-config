require("nvim-treesitter.configs").setup({
	ensure_installed = {"typescript", "lua", "go", "json"},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
	},
})

