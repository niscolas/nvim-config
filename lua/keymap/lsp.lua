local M = {}

M.setup = function(bufnr)
    local opts = { silent = true, buffer = bufnr }

    --- actions
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.formatting, opts)

    --- info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    --- navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    --- diagnostic
    vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
end

return M
