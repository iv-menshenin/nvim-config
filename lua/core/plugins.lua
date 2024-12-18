local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker", -- press 'w' to chose the window to open file
				name = 'window-picker',
				event = 'VeryLazy',
				version = '2.*',
				config = function()
					require'window-picker'.setup({
						hint = "floating-big-letter",
						selection_chars = 'FJDKSLA;CMRUEIWOQP',
					})
				end,
			}
		}
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				build = ":TSUpdate",
			}
		},
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = {"CmdlineEnter"},
		ft = {"go", "gomod"},
		build = ':lua require("go.install").update_all_sync()', -- update binaries
	},
	{ "sainnhe/gruvbox-material" },
--	{ "nvim-treesitter/nvim-treesitter-refactor" },
	{
		"leoluz/nvim-dap-go",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()
			require("nvim-dap-virtual-text").setup()

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end
	},
--	{
--		"nvim-telescope/telescope.nvim",
--			dependencies = {
--			"nvim-lua/plenary.nvim",
--			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--		},
--	},
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
         options = {
             component_separators = { left = '', right = '' },
             section_separators = { left = '', right = '' },
         },
         sections = {
             lualine_a = {'mode'},
             lualine_b = {'branch', 'diff', 'diagnostics'},
             lualine_c = {'filename'},
             lualine_x = {'encoding'},
             lualine_y = {'progress'},
             lualine_z = {'location'},
         },
     },
     config = function(_, opts)
         require('lualine').setup(opts)
     end
     },
     { 'RRethy/vim-illuminate' },
     { 'lewis6991/gitsigns.nvim' },
})

