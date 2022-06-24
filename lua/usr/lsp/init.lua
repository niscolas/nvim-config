local M = {}

M.servers = {
    ["gdscript"] = true,
    ["jsonls"] = true,
    ["omnisharp"] = true,
    ["rust_analyzer"] = true,
    ["sumneko_lua"] = true,
    ["vimls"] = true,
}

M.ensure_installed_servers = {
    "jsonls",
    "rust_analyzer",
    "sumneko_lua",
    "vimls"
}

M.setup = function()
    require("usr.lsp.lsp_installer").setup()
    require("usr.lsp.handlers").setup()
    require("usr.lsp.lsp_config").setup()
end

return M
