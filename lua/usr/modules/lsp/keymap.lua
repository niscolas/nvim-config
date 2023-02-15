local M = {}

M._setup = function(opts)
    local bufnr = opts.bufnr
    local silent_opts = { silent = true, buffer = bufnr }
    local format_fn = require("usr.modules.lsp.format")._get_format_fn()

    --- actions
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, silent_opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, silent_opts)
    vim.keymap.set("n", "<Leader>cf", function()
        format_fn(bufnr)
    end, silent_opts)

    --- info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, silent_opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, silent_opts)

    --- diagnostic
    vim.keymap.set("n", "L", vim.diagnostic.open_float, silent_opts)
    vim.keymap.set("n", "<Leader>dl", vim.diagnostic.setloclist, silent_opts)

    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next { border = "rounded" }
    end, silent_opts)

    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev { border = "rounded" }
    end, silent_opts)
end

return M
