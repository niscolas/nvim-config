local M = {}

M.ensure_installed_servers = {
    "jsonls",
    "omnisharp",
    "rust_analyzer",
    "sumneko_lua",
    "vimls"
}

local path = require("path")
M.lsp_installer_path = path.concat { vim.fn.stdpath("data"), "lsp_servers" }

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
    require("usr.modules.lsp.lsp_config").setup()
    require("usr.modules.lsp.handlers").setup()
end

return M
