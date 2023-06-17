local M = {}

M.formatters = require("usr.lsp.format")._formatters

M.get_ensure_installed_servers = function()
    local usr_lsp_core = require("usr.lsp.core")

    for server, config in pairs(usr_lsp_core.servers) do
        if config.ensure_installed then
            table.insert(usr_lsp_core.ensure_installed_servers, server)
        end
    end

    return usr_lsp_core.ensure_installed_servers
end

M.setup = function()
    require("usr.lsp.diagnostics").setup()
    require("usr.lsp.handlers").setup()
    require("usr.lsp.lsp_config").setup()
end

return M
