local M = {}

M.extra_ensure_installed = {

}

M.setup = function()
    local usr_lsp = require("usr.lsp")
    local mason = require("mason")

    mason.setup()

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup {
        ensure_installed = usr_lsp.get_ensure_installed_servers(),
    }
end

return M
