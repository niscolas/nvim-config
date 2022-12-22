local core_ok, core = try_usr_module_require("lsp.core")

if not core_ok then
    return
end

local setup_ensure_installed_servers = function()
    for server, config in pairs(core.servers) do
        if config.ensure_installed then
            table.insert(core.ensure_installed_servers, server)
        end
    end
end

setup_ensure_installed_servers()

usr_module_require("lsp.handlers").setup()
usr_module_require("lsp.lsp_config").setup()
