local omnisharp_bin = vim.fn.expand "$HOME/.local/share/nvim/lsp_servers/omnisharp-mono/OmniSharp.exe"
local pid = vim.fn.getpid()

vim.lsp.handlers["textDocument/definition"] = require("omnisharp_extended").handler

return {
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler
    },
    cmd = { "mono", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}
