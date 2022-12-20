local M = {}

M.lsp_servers_path = vim.fn.stdpath("data") .. "/mason/packages"

M.servers = {
    ["gdscript"] = {
        ensure_installed = false,
        has_custom_config = false,
    },
    ["jsonls"] = {
        ensure_installed = true,
        has_custom_config = false,
    },
    ["omnisharp"] = {
        ensure_installed = true,
        has_custom_config = true,
    },
    ["rust_analyzer"] = {
        ensure_installed = true,
        has_custom_config = false,
    },
    ["sumneko_lua"] = {
        ensure_installed = true,
        has_custom_config = true,
    },
    ["vimls"] = {
        ensure_installed = true,
        has_custom_config = false,
    }
}

M.ensure_installed_servers = {}

local setup_ensure_installed_servers = function()
    for server, config in pairs(M.servers) do
        if config.ensure_installed then
            table.insert(M.ensure_installed_servers, server)
        end
    end
end

M.setup = function()
    setup_ensure_installed_servers()

    reqmod("lsp.handlers").setup()
    reqmod("lsp.lsp_config").setup()
end

return M
