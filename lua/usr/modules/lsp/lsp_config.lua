local M = {}

local function override_server_opts(default_server_opts, server)
    server = "lsp.servers." .. server
    local server_opts_ok, server_opts = try_reqmod(server)

    if server_opts_ok then
        return vim.tbl_deep_extend("force", default_server_opts, server_opts)
    else
        return default_server_opts
    end
end

local function get_default_opts(handlers)
    local result = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }

    return result
end

local function get_server_custom_opts(server, servers, handlers)
    local default_opts = get_default_opts(handlers)

    if servers[server] then
        default_opts = override_server_opts(default_opts, server)
    end

    return default_opts
end

M.setup = function()
    local lsp_config_ok, lsp_config = try_req("lspconfig")
    local usr_lsp_ok, usr_lsp = try_reqmod("lsp")
    local usr_handlers_ok, usr_handlers = try_reqmod("lsp.handlers")

    if not usr_lsp_ok or
        not usr_handlers_ok or
        not lsp_config_ok then
        return
    end

    for server, config in pairs(usr_lsp.servers) do
        local opts

        if config.has_custom_config then
            opts = get_server_custom_opts(server, usr_lsp.servers, usr_handlers)
        else
            opts = get_default_opts(usr_handlers)
        end

        lsp_config[server].setup(opts)
    end
end

return M
