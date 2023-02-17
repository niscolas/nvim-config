local augroup = augroup("core", { clear = true })

autocmd("TextYankPost", {
    group = augroup,
    pattern = "*",
    callback = function(args)
        vim.highlight.on_yank { timeout = 300 }
    end,
})
