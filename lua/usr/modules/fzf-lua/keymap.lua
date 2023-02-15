local M = {}

M._setup_core_keymap = function()
    vim.keymap.set(
        "n",
        "<C-p>",
        require("fzf-lua").files,
        { desc = "Fzf-Lua [P]roject Files" }
    )

    vim.keymap.set(
        "n",
        "<C-b>",
        require("fzf-lua").buffers,
        { desc = "Fzf-Lua [B]uffers" }
    )

    vim.keymap.set(
        "n",
        "<Leader>fr",
        require("fzf-lua").resume,
        { desc = "Fzf-Lua [F]ind [R]esume" }
    )

    vim.keymap.set(
        "n",
        "<C-f>",
        require("fzf-lua").grep,
        { desc = "Fzf-Lua Grep ([F]ind)" }
    )
end

M._setup_lsp_keymap = function()
    vim.keymap.set(
        "n",
        "gd",
        require("fzf-lua").lsp_definitions,
        { desc = "Fzf-Lua [G]o to [D]efinition" }
    )

    vim.keymap.set(
        "n",
        "<Leader>fs",
        require("fzf-lua").lsp_document_symbols,
        { desc = "[F]ind [S]ymbols" }
    )

    vim.keymap.set(
        "n",
        "<Leader>fu",
        require("fzf-lua").lsp_references,
        { desc = "Fzf-Lua [F]ind [U]sages / References" }
    )

    vim.keymap.set(
        "n",
        "<Leader>fi",
        require("fzf-lua").lsp_implementations,
        { desc = "Fzf-Lua [F]ind [I]mplementations" }
    )
end

return M
