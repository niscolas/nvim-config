local usr_lsp_core = require("usr.modules.lsp.core")
local util = require("lspconfig.util")

local custom_on_attach = function(bufnr)
    keymap("n", "gd", require("omnisharp_extended").telescope_lsp_definitions)
end

local on_attach = function(client, bufnr)
    local usr_handlers = require("usr.modules.lsp.handlers")

    usr_handlers._on_attach(client, bufnr)
    custom_on_attach(bufnr)
end

local omnisharp_path = usr_lsp_core.lsp_servers_path
    .. "/omnisharp/Omnisharp.dll"

return {
    cmd = { "dotnet", omnisharp_path },
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    on_attach = on_attach,
    root_dir = util.root_pattern("*.sln"),
}
