local M = {}

M.setup = function()
    local usr_lsp_ok, usr_lsp = pcall(require, "usr.modules.lsp")
    local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

    if not lsp_installer_ok or
        not usr_lsp_ok then
        return
    end

    lsp_installer.setup {
        automatic_installation = false,
        ensure_installed = usr_lsp.ensure_installed_servers,
        install_root_dir = usr_lsp.lsp_installer_path,
    }
end

return M
