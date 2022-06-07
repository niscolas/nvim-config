local M = {}

M.setup = function()
    local usr_lsp_ok, usr_lsp = pcall(require, "usr.lsp")
    local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

    if not lsp_installer_ok or
        not usr_lsp_ok then
        return
    end

    lsp_installer.setup {
        ensure_installed = usr_lsp.ensure_installed_servers,
        automatic_installation = true,
    }
end

return M
