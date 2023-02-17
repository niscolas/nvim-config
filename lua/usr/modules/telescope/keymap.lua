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
    new_keymap(
        "n",
        "<C-b>",
        require("telescope.builtin").buffers,
        { desc = "Telescope [B]uffers" }
    )
    new_keymap(
        "n",
        "<Leader>tr",
        require("telescope.builtin").resume,
        { desc = "[T]elescope [R]esume" }
    )
    new_keymap(
        "n",
        "<C-f>",
        require("telescope.builtin").live_grep,
        { desc = "Telescope Live Grep ([F]ind Text)" }
    )
    new_keymap(
        "n",
        "<C-p>",
        require("telescope.builtin").find_files,
        { desc = "Telescope [P]roject Files" }
    )
end

M.load_extensions_keymap = function()
    --- extensions
    -- keymap("n", "<Leader>tp", require("telescope").extensions.project.project, {desc = "[T]elescope [P]rojects"})
    -- keymap("n", "<Leader>e", require("telescope").extensions.file_browser.file_browser, {desc = "Telescope [P]roject Files"})
end

M.setup_lsp_on_attach_keymap = function(client, bufnr)
    new_keymap("n", "<Leader>fs", require("telescope.builtin").lsp_document_symbols)

    new_keymap("n", "gd", require("telescope.builtin").lsp_definitions)

    new_keymap("n", "<Leader>fu", function()
        require("telescope.builtin").lsp_references {
            include_declaration = false,
            show_line = false,
        }
    end)

    new_keymap("n", "<Leader>fi", require("telescope.builtin").lsp_implementations)
end

return M
