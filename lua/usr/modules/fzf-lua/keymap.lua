local M = {}

M._setup_core_keymap = function()
    keymap(
        "n",
        "<C-p>",
        require("fzf-lua").files,
        { desc = "Fzf-Lua [P]roject Files" }
    )

    keymap(
        "n",
        "<C-b>",
        require("fzf-lua").buffers,
        { desc = "Fzf-Lua [B]uffers" }
    )

    keymap(
        "n",
        "<Leader>fr",
        require("fzf-lua").resume,
        { desc = "Fzf-Lua [F]ind [R]esume" }
    )

    keymap(
        "n",
        "<C-f>",
        require("fzf-lua").grep,
        { desc = "Fzf-Lua Grep ([F]ind)" }
    )
end

M._setup_lsp_keymap = function()
    keymap(
        "n",
        "gd",
        require("fzf-lua").lsp_definitions,
        { desc = "Fzf-Lua [G]o to [D]efinition" }
    )

    keymap(
        "n",
        "<Leader>fs",
        require("fzf-lua").lsp_document_symbols,
        { desc = "[F]ind [S]ymbols" }
    )

    keymap(
        "n",
        "<Leader>fu",
        require("fzf-lua").lsp_references,
        { desc = "Fzf-Lua [F]ind [U]sages / References" }
    )

    keymap(
        "n",
        "<Leader>fi",
        require("fzf-lua").lsp_implementations,
        { desc = "Fzf-Lua [F]ind [I]mplementations" }
    )
end

return M
