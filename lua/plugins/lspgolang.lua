local lspc = require("lspconfig")

lspc.ts_ls.setup{}
lspc.prismals.setup {}
lspc.gopls.setup {
	cmd = { "gopls" },
	on_attach = function(client, bufnr)
		-- vim.bo.bufnr = bufnr
		vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	end,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		}
	}
}

local configs = require 'lspconfig/configs'
configs.golangcilsp = {
	default_config = {
		cmd = {'golangci-lint-langserver'},
		root_dir = lspc.util.root_pattern('go.mod'),
		init_options = {
			command = { "golangci-lint", "run", "--config", "../../../lint/.golangci.yml", "--out-format", "json", "--issues-exit-code=1" };
		},
	},
}
lspc.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}

require("go").setup{}

-- Autocompletension
local cmp = require('cmp')
cmp.setup {
	mapping = {
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	sources = {
		{ name = "buffer" },
		{ name = "nvim_lsp" },
	}
}
