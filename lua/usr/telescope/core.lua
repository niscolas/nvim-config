local telescope_previewers = require("telescope.previewers")

local usr_telescope_keymap = require("usr.telescope.keymap")
local usr_telescope_util = require("usr.telescope.util")
-- local usr_telescope_hologram = require("usr.telescope.hologram")

local M = {}

M.setup_opts = {
    extensions = {
        file_browser = {
            cwd_to_path = true,
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            path = "%:p:h",
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        },
    },
    defaults = {
        -- buffer_previewer_maker = usr_telescope_hologram.buffer_previewer_maker,
        -- file_previewer = telescope_previewers.cat.new,
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                results_width = 0.4,
                preview_width = 0.6,
            },
            vertical = {
                mirror = false,
            },
            width = 0.9,
            height = 0.9,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_ignore_patterns = usr_telescope_util.get_file_ignore_patterns(),
        mappings = usr_telescope_keymap.mappings,
    },
    pickers = {
        find_files = {
            find_command = {
                "rg",
                "--ignore",
                "--hidden",
                "--files",
            },
        },
        live_grep = {},
        diagnostics = {},
        lsp_document_symbols = {},
        lsp_definitions = {},
        lsp_implementations = {},
        lsp_references = {},
    },
}

return M
