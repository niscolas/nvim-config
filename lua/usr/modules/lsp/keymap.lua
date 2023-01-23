local M = {}

M.setup = function(bufnr)
    local silent_opts = { silent = true, buffer = bufnr }
    local nonsilent_opts = { silent = false, buffer = bufnr }

    --- actions
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, silent_opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, silent_opts)
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, silent_opts)

    --- info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, silent_opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, silent_opts)

    --- lsp
    vim.keymap.set("n", "<Leader>fs", require("telescope.builtin").lsp_document_symbols)

    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)

    vim.keymap.set(
        "n", "<Leader>fu",
        function()
            require("telescope.builtin").lsp_references({
                include_declaration = false,
                show_line = false
            })
        end)

    vim.keymap.set("n", "<Leader>fi", require("telescope.builtin").lsp_implementations)

    --- diagnostic
    vim.keymap.set("n", "L", vim.diagnostic.open_float, silent_opts)
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, silent_opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, silent_opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, silent_opts)
end

return M
