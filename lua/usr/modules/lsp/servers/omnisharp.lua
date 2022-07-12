local custom_on_attach = function()
    vim.keymap.set(
        "n", "gd",
        function()
            require("omnisharp_extended").telescope_lsp_definitions()
        end)
end

local on_attach = function(client, bufnr)
    local usr_handlers_ok, usr_handlers = try_reqmod("lsp.handlers")

    if usr_handlers_ok then
        usr_handlers.on_attach(client, bufnr)
        custom_on_attach()
    else
        custom_on_attach()
    end
end

return {
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    on_attach = on_attach,
}
