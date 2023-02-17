local M = {}

M.formatters = require("usr.modules.lsp.format")._formatters

M.on_attach_functions =
    require("usr.modules.lsp.handlers")._post_on_attach_functions

M.setup = function()
    local usr_lsp_core = require("usr.modules.lsp.core")

    local setup_ensure_installed_servers = function()
        for server, config in pairs(usr_lsp_core.servers) do
            if config.ensure_installed then
                table.insert(usr_lsp_core.ensure_installed_servers, server)
            end
        end
    end

    setup_ensure_installed_servers()

    require("usr.modules.lsp.diagnostics").setup()
    require("usr.modules.lsp.handlers").setup()
    require("usr.modules.lsp.lsp_config").setup()
end

return M
