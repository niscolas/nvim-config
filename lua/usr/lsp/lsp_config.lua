local M = {}

local function override_server_opts(opts, server)
    server = "usr.lsp.servers." .. server
    local has_server_opts, server_opts = pcall(require, server)

    if has_server_opts then
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    return opts
end

local function get_server_opts(server, servers, handlers)
    local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }

    if servers[server] then
        opts = override_server_opts(opts, server)
    end

    return opts
end

M.setup = function()
    local lsp_config_ok, lsp_config = pcall(require, "lspconfig")
    local usr_lsp_ok, usr_lsp = pcall(require, "usr.lsp")
    local usr_handlers_ok, usr_handlers = pcall(require, "usr.lsp.handlers")

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
