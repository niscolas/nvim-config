local usr_lsp_core = require("usr.modules.lsp.core")
local mason = require("mason")

mason.setup()

local mason_lspconfig = require("mason-lspconfig")

print("A")
mason_lspconfig.setup {
    ensure_installed = usr_lsp_core.ensure_installed_servers,
}
print("b")
