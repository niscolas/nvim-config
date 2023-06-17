local M = {}

M._setup = function(opts)
    local bufnr = opts.bufnr
    local silent_opts = { silent = true, buffer = bufnr }
    local format_fn = require("usr.lsp.format")._get_format_fn()

    --- actions
    new_keymap("n", "<Leader>ca", vim.lsp.buf.code_action, silent_opts)
    new_keymap("n", "<Leader>rn", vim.lsp.buf.rename, silent_opts)
    new_keymap("n", "<Leader>cf", function()
        format_fn(bufnr)
    end, silent_opts)

    --- info
    new_keymap("n", "K", vim.lsp.buf.hover, silent_opts)
    new_keymap("n", "<C-k>", vim.lsp.buf.signature_help, silent_opts)

    --- diagnostic
    new_keymap("n", "L", vim.diagnostic.open_float, silent_opts)
    new_keymap("n", "<Leader>dl", vim.diagnostic.setloclist, silent_opts)

    new_keymap("n", "]e", function()
        vim.diagnostic.goto_next {
            border = "rounded",
            severity = { min = vim.diagnostic.severity.WARN },
        }
    end, silent_opts)

    new_keymap("n", "[e", function()
        vim.diagnostic.goto_prev {
            border = "rounded",
            severity = { min = vim.diagnostic.severity.WARN },
        }
    end, silent_opts)

    new_keymap("n", "]d", function()
        vim.diagnostic.goto_next {
            border = "rounded",
            severity = { max = vim.diagnostic.severity.INFO },
        }
    end, silent_opts)

    new_keymap("n", "[d", function()
        vim.diagnostic.goto_prev {
            border = "rounded",
            severity = { max = vim.diagnostic.severity.INFO },
        }
    end, silent_opts)
end

return M
