local usr_lsp_ok, usr_lsp = try_usr_module_require("lsp")
local util = require("lspconfig/util")

if not usr_lsp_ok then
    return
end

local custom_on_attach = function()
    vim.keymap.set(
        "n", "gd",
        function()
            require("omnisharp_extended").telescope_lsp_definitions()
        end)
end

local on_attach = function(client, bufnr)
    local usr_handlers_ok, usr_handlers = try_usr_module_require("lsp.handlers")

    if usr_handlers_ok then
        usr_handlers.on_attach(client, bufnr)
        custom_on_attach()
    else
        custom_on_attach()
    end
end

local omnisharp_path = usr_lsp.lsp_servers_path .. "/omnisharp/Omnisharp.dll"

return {
    cmd = { "dotnet", omnisharp_path },
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    on_attach = on_attach,
    root_dir = util.root_pattern("*.sln"),
}
