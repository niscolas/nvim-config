local augroup = new_augroup("core", { clear = true })

new_autocmd("TextYankPost", {
    group = augroup,
    pattern = "*",
    callback = function(args)
        vim.highlight.on_yank { timeout = 300 }
    end,
})
