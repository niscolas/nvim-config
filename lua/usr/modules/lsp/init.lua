local M = {}

M.formatters = require("usr.modules.lsp.format")._formatters

M.on_attach_functions =
    require("usr.modules.lsp.handlers")._post_on_attach_functions

M.get_ensure_installed_servers = function()
    local usr_lsp_core = require("usr.modules.lsp.core")

    for server, config in pairs(usr_lsp_core.servers) do
        if config.ensure_installed then
            table.insert(usr_lsp_core.ensure_installed_servers, server)
        end
    end

    return usr_lsp_core.ensure_installed_servers
end

M.setup = function()
    require("usr.modules.lsp.diagnostics").setup()
    require("usr.modules.lsp.handlers").setup()
    require("usr.modules.lsp.lsp_config").setup()
end

return M
