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
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, silent_opts)

    --- lsp
    vim.keymap.set("n", "<Leader>fd", function() require("telescope.builtin").diagnostics() end)
    vim.keymap.set("n", "<Leader>fs", function() require("telescope.builtin").lsp_document_symbols() end)
    vim.keymap.set("n", "Gd", function() require("telescope.builtin").lsp_definitions() end)
    vim.keymap.set("n", "<Leader>fr", function() require("telescope.builtin").lsp_references() end)
    vim.keymap.set("n", "<Leader>fi", function() require("telescope.builtin").lsp_implementations() end)

    --- diagnostic
    vim.keymap.set("n", "L", vim.diagnostic.open_float, silent_opts)
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, silent_opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, silent_opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, silent_opts)
end

return M
