local M = {}

M.setup = function(bufnr)
    local silent_opts = { silent = true, buffer = bufnr }
    local nonsilent_opts = { silent = false, buffer = bufnr }

    --- actions
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, silent_opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, silent_opts)
    vim.keymap.set(
        "n", "<leader>cf",
        function()
            vim.lsp.buf.format({ async = true })
        end,
        silent_opts)

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

    --- lsp
    vim.keymap.set("n", "<leader>td", function() require("telescope.builtin").diagnostics() end)
    vim.keymap.set("n", "<leader>ts", function() require("telescope.builtin").lsp_document_symbols() end)
    vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end)
    vim.keymap.set("n", "<leader>tr", function() require("telescope.builtin").lsp_references() end)
    vim.keymap.set("n", "<leader>ti", function() require("telescope.builtin").lsp_implementations() end)

    --- diagnostic
    vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, silent_opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, silent_opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, silent_opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, silent_opts)
end

return M
