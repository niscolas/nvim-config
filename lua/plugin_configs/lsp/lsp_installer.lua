local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local handlers_ok, handlers = pcall(require, "plugin_configs.lsp.handlers")

if not lsp_installer_ok or not handlers_ok then
    return
end

local servers = {
    ["omnisharp"] = true,
    ["sumneko_lua"] = true
}

local function install_servers(servers)
    for _, name in pairs(servers) do
        local server_is_found, server = lsp_installer.get_server(name)
        if server_is_found and not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

local function override_server_opts(opts, server_name)
    server_name = "lsp.server_configs" .. server_name
    local has_server_opts, server_opts = pcall(require, server_name)
    if not has_server_opts then
        return
    end

    opts = vim.tbl_deep_extend("force", server_opts, opts)
end

local function on_server_ready(server)
    local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }

    local server_name = server.name
    if servers[server_name] then
        override_server_opts(opts, server_name)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end

install_servers(servers)
lsp_installer.on_server_ready(on_server_ready)
