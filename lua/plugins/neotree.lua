-- File icons helper
vim.fn.sign_define("DiagnosticSignError",
	{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
	{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
	{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
	{text = "󰌵", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
	close_if_last_window = true,
	use_libuv_file_watcher = true,
	enable_git_status = true,
	enable_diagnostics = true,
	follow_current_file = { enabled = true },
})

