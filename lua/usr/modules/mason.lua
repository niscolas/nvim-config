local usr_lsp_core_ok, usr_lsp_core = try_usr_module_require("lsp.core")
local mason_ok, mason = try_require("mason")

if not mason_ok or not usr_lsp_core_ok then
    return
end

mason.setup()

local mason_lspconfig_ok, mason_lspconfig = try_require("mason-lspconfig")

if not mason_lspconfig_ok then
    return
end

mason_lspconfig.setup {
    ensure_installed = usr_lsp_core.ensure_installed_servers,
}
