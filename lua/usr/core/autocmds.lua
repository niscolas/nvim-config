local vim = vim;

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function(args) 
        vim.highlight.on_yank { timeout = 300 }
    end,
})
