local M = {}

local telescope_actions = require("telescope.actions")

local default_mappings = {
    ["<C-n>"] = function(opts)
        telescope_actions.toggle_selection(opts)
        telescope_actions.move_selection_next(opts)
    end,
    ["<C-p>"] = function(opts)
        telescope_actions.toggle_selection(opts)
        telescope_actions.move_selection_previous(opts)
    end,
    ["<Tab>"] = function(opts)
        telescope_actions.move_selection_next(opts)
    end,
    ["<S-tab>"] = function(opts)
        telescope_actions.move_selection_previous(opts)
    end,
}

M.mappings = {
    i = default_mappings,
    n = default_mappings,
}

M.load_core_keymap = function()
    vim.keymap.set(
        "n",
        "<C-b>",
        require("telescope.builtin").buffers,
        { desc = "Telescope [B]uffers" }
    )
    vim.keymap.set(
        "n",
        "<Leader>tr",
        require("telescope.builtin").resume,
        { desc = "[T]elescope [R]esume" }
    )
    vim.keymap.set(
        "n",
        "<C-f>",
        require("telescope.builtin").live_grep,
        { desc = "Telescope Live Grep ([F]ind Text)" }
    )
    vim.keymap.set(
        "n",
        "<C-p>",
        require("telescope.builtin").find_files,
        { desc = "Telescope [P]roject Files" }
    )
end

M.load_extensions_keymap = function()
    --- extensions
    -- vim.keymap.set("n", "<Leader>tp", require("telescope").extensions.project.project, {desc = "[T]elescope [P]rojects"})
    -- vim.keymap.set("n", "<Leader>e", require("telescope").extensions.file_browser.file_browser, {desc = "Telescope [P]roject Files"})
end

M.setup_lsp_on_attach_keymap = function(client, bufnr)
    vim.keymap.set(
        "n",
        "<Leader>fs",
        require("telescope.builtin").lsp_document_symbols
    )

    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)

    vim.keymap.set("n", "<Leader>fu", function()
        require("telescope.builtin").lsp_references {
            include_declaration = false,
            show_line = false,
        }
    end)

    vim.keymap.set(
        "n",
        "<Leader>fi",
        require("telescope.builtin").lsp_implementations
    )
end

return M
