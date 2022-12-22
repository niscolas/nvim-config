local M = {}

local function override_server_opts(default_server_opts, server)
    server = "lsp.servers." .. server
    local server_opts = usr_module_require(server)

    return vim.tbl_deep_extend("force", default_server_opts, server_opts)
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
    local lspconfig = require("lspconfig")
    local usr_lsp_core = usr_module_require("lsp.core")
    local usr_handlers = usr_module_require("lsp.handlers")

    for server, config in pairs(usr_lsp_core.servers) do
        local opts

        if config.has_custom_config then
            opts = get_server_custom_opts(server, usr_lsp_core.servers, usr_handlers)
        else
            opts = get_default_opts(usr_handlers)
        end

        lspconfig[server].setup(opts)
    end
end

return M
