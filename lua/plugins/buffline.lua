require("bufferline").setup({
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            custom_filter = function(buf_number, buf_numbers)
                -- print(vim.bo[buf_number].filetype)
                -- print(vim.fn.bufname(buf_number))
                if vim.bo[buf_number].filetype == "qf" then -- quick find
                    return false
                end
                if vim.fn.bufname(buf_number) == "qf" then
                    return false
                end
                return true
            end,
        }
})

