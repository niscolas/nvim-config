local M = {}

M.ensure_installed_servers = {
    "jsonls",
    -- "omnisharp",
    "rust_analyzer",
    "sumneko_lua",
    "vimls"
}

M.lsp_installer_path = vim.fn.stdpath("data") .. "/lsp_servers"

M.servers = {
    ["gdscript"] = true,
    ["jsonls"] = true,
    ["omnisharp"] = true,
    ["rust_analyzer"] = true,
    ["sumneko_lua"] = true,
    ["vimls"] = true,
}

M.setup = function()
    require("usr.modules.lsp.lsp_installer").setup()
    require("usr.modules.lsp.handlers").setup()
    require("usr.modules.lsp.lsp_config").setup()
end

return M
