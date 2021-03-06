local M = {}

M.lsp_installer_path = vim.fn.stdpath("data") .. "/lsp_servers"

M.servers = {
    ["gdscript"] = true,
    ["jsonls"] = true,
    ["omnisharp"] = true,
    ["rust_analyzer"] = true,
    ["sumneko_lua"] = true,
    ["vimls"] = true,
}

M.ensure_installed_servers = {}

local setup_ensure_installed_servers = function()
    for server, ensure_installed in pairs(M.servers) do
        if ensure_installed then
            table.insert(M.ensure_installed_servers, server)
        end
    end
end

M.config = function()
    setup_ensure_installed_servers()

    reqmod("lsp.lsp_installer").setup()
    reqmod("lsp.handlers").setup()
    reqmod("lsp.lsp_config").setup()
end

return M
