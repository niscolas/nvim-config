local usr_lsp = require("usr.modules.lsp")
local mason = require("mason")

mason.setup()

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
    ensure_installed = usr_lsp.get_ensure_installed_servers(),
}
