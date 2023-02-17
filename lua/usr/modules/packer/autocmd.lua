local augroup = augroup("packer", { clear = true })
autocmd("BufWritePost", {
    group = augroup,
    pattern = "**/packer/spec.lua",
    callback = function(opts)
        vim.cmd.source("lua/usr/modules/packer/spec.lua")
        vim.cmd.PackerSync()
    end,
})
