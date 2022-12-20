local M = {}

M.setup = function()
    local usr_lsp_ok, usr_lsp = try_reqmod("lsp")
    local mason_ok, mason = try_req("mason")

    if not mason_ok or not usr_lsp_ok then
        return
    end

    mason.setup()

    local mason_lspconfig_ok, mason_lspconfig = try_req("mason-lspconfig")

    if not mason_lspconfig_ok then
        return
    end

    mason_lspconfig.setup{
        ensure_installed = usr_lsp.ensure_installed_servers,
    }
end

return M