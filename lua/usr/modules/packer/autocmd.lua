local augroup = new_augroup("packer", { clear = true })
new_autocmd("BufWritePost", {
    group = augroup,
    pattern = "**/packer/spec.lua",
    callback = function(opts)
        cmd.source("lua/usr/modules/packer/spec.lua")
        cmd.PackerCompile()
    end,
})
