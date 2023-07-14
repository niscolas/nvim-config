require("luasnip.loaders.from_lua").load {
    paths = "./lua/usr/luasnip/snippets/specs",
}

local augroup = new_augroup("my-luasnips", { clear = true })

new_autocmd("BufWritePost", {
    group = augroup,
    pattern = "**/luasnip/snippets/*.lua",
    callback = function(args)
        cmd.source("lua/usr/luasnip/snippets/init.lua")
    end,
})
