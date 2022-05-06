local M = {}

M.setup = function(bufnr)
    local silent_opts = { silent = true, buffer = bufnr }
    local nonsilent_opts = { silent = false, buffer = bufnr }

    --- actions
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, silent_opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, silent_opts)
    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.formatting, silent_opts)

    --- info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, silent_opts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, silent_opts)
    vim.keymap.set("n", "<leader>li", ":LspInfo<cr>", nonsilent_opts)
    vim.keymap.set("n", "<leader>ls", ":LspStart<cr>", nonsilent_opts)
    vim.keymap.set("n", "<leader>lo", ":LspStop<cr>", nonsilent_opts)
    vim.keymap.set("n", "<leader>lr", ":LspRestart<cr>", nonsilent_opts)

    --- navigation
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    --- diagnostic
    vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, silent_opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, silent_opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, silent_opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, silent_opts)
end

return M
