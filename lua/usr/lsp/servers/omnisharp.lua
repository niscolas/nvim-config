local omnisharp_bin = vim.fn.expand "$HOME/.local/share/nvim/lsp_servers/omnisharp-mono/OmniSharp.exe"
local pid = vim.fn.getpid()

local handlers = vim.tbl_flatten(vim.lsp.handlers)
handlers ["textDocument/definition"] = require("omnisharp_extended").handler

return {
    handlers = handlers,
    -- cmd = { "dotnet", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}
