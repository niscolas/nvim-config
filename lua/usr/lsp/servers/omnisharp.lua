local omnisharp_bin = vim.fn.expand "$HOME/.local/share/nvim/lsp_servers/omnisharp-linux-x64/run"
local pid = vim.fn.getpid()

return {
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}
