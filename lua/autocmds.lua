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

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function ()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end
})
