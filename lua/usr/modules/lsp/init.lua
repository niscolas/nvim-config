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

M.config = function()
    reqmod("lsp.lsp_installer").setup()
    reqmod("lsp.handlers").setup()
    reqmod("lsp.lsp_config").setup()
end

return M
