local luasnip_ok, luasnip = pcall(require, "luasnip")

print("AAAAAAAAAAA")

if not luasnip_ok then
    return
end

print("BBBBBB")

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
}

require("usr.modules.luasnip.snippets")
require("luasnip.loaders.from_vscode").lazy_load()
