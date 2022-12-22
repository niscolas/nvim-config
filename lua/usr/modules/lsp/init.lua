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

print("loading lsp")
print("loaded lsp core")

setup_ensure_installed_servers()
print("loaded lsp servers")

usr_module_require("lsp.handlers").setup()
print("loaded lsp handlers")
usr_module_require("lsp.lsp_config").setup()
print("loaded lsp")
