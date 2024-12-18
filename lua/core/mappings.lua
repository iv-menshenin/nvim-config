vim.g.mapleader = " "

local noremap = {noremap = true}
-- Neo Tree
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal_force_cwd left<CR>', noremap)
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>', noremap)

-- Buffline
vim.keymap.set('n', '<M-,>', ':BufferLineCyclePrev<CR>', noremap)   -- Alt + <
vim.keymap.set('n', '<M-.>', ':BufferLineCycleNext<CR>', noremap)   -- Alt + >
vim.keymap.set('n', '<C-b>.', ':BufferLineCloseRight<CR>', noremap)
vim.keymap.set('n', '<C-b>,', ':BufferLineCloseLeft<CR>', noremap)
vim.keymap.set('n', '<C-b>c', ':BufferLineCloseOthers<CR>', noremap)

-- Disable arrows
vim.keymap.set('n', '<left>', '', noremap)
vim.keymap.set('n', '<right>', '', noremap)
vim.keymap.set('n', '<up>', '', noremap)
vim.keymap.set('n', '<down>', '', noremap)

-- Go Tests
vim.keymap.set('n', '<leader>tt', ':GoTestPkg -v<CR>', noremap)
vim.keymap.set('n', '<leader>tf', ':GoTestFunc -v<CR>', noremap)

-- Code Helpers
vim.keymap.set('n', '<leader> ', ':TSTextobjectPeekDefinitionCode @class.outer<CR>', noremap)    -- short definition popup
vim.keymap.set('n', '<leader>i', ':TSTextobjectPeekDefinitionCode @function.outer<CR>', noremap) -- definition popup (with inner code)

local bufopts = {noremap = true, silent = true}
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)    -- go to object declaration
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)     -- go to object definition
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) -- go to interface definition/implementation
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)     -- go to object references
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)           -- show definition in popup

vim.keymap.set('n', '<leader>fb', 'zfiB', { desc = 'Fold [b]lock' })
vim.keymap.set('n', '<leader>fB', 'zo', { desc = 'Unfold [B]lock' })

-- Debug
vim.keymap.set("n", "<leader>b", require'dap'.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>gb", require'dap'.run_to_cursor, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>?", function()
	require'dapui'.eval(nil, { enter = true })
end, noremap)

vim.keymap.set("n", "<F10>", require'dap'.continue)
vim.keymap.set("n", "<F7>", require'dap'.step_into)
vim.keymap.set("n", "<F9>", require'dap'.step_over)
vim.keymap.set("n", "<F8>", require'dap'.step_out)
vim.keymap.set("n", "<F6>", require'dap'.step_back)
vim.keymap.set("n", "<F12>", require'dap'.restart)
