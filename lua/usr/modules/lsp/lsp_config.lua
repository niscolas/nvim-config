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

local function get_server_opts(server, servers, handlers)
    local default_opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }

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

    for _, server in ipairs(vim.tbl_keys(usr_lsp.servers)) do
        local opts = get_server_opts(server, usr_lsp.servers, usr_handlers)
        lsp_config[server].setup(opts)
    end
end

return M
