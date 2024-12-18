-- Autoformatting golang files
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- Whitespaces trimming
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.cmd([[
         keeppatterns %s/\s\+$//e
      ]])
    end,
    group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})

-- Change tabindent for YAML
local ftGroup = vim.api.nvim_create_augroup("filetype_group", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*.yaml",
    command = "setlocal ts=2 sts=2 sw=2 expandtab",
    group = ftGroup,
})

-- Switch to absolute line numbers in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        vim.opt.relativenumber = false
        vim.opt.cursorline = false
    end,
})

-- Switch to relative line numbers in normal mode
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        vim.opt.relativenumber = true
        vim.opt.cursorline = true
    end,
})
