local usr_lsp_core = usr_module_require("lsp.core")
local mason = require("mason")

mason.setup()

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
    ensure_installed = usr_lsp_core.ensure_installed_servers,
}
