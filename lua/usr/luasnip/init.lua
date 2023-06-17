local M = {}

M.setup = function()
    local luasnip = require("luasnip")

    luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
    }

    require("usr.luasnip.snippets")
    require("luasnip.loaders.from_vscode").lazy_load()
end

return M
