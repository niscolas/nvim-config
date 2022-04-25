local cmd = vim.cmd

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "settings.lua", "keybindings.lua" },
    command = "source <afile>"
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync"
})

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function(args) 
        vim.highlight.on_yank { timeout = 300 }
    end,
})

