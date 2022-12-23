local usr_lsp_core = usr_module_require("lsp.core")

local setup_ensure_installed_servers = function()
    for server, config in pairs(usr_lsp_core.servers) do
        if config.ensure_installed then
            table.insert(usr_lsp_core.ensure_installed_servers, server)
        end
    end
end

setup_ensure_installed_servers()

usr_module_require("lsp.handlers").setup()
usr_module_require("lsp.lsp_config").setup()
