local M = {}

M.config = function()
    local telescope = require("telescope")
    telescope.setup {
        extensions = {
            ["fzf"] = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {},

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
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
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
            file_ignore_patterns = {
                "^.git",
                "node_modules",
                "[Ll]ibrary",
                "%.asmdef",
                "%.asset",
                "%.bank",
                "%.csproj",
                "%.dll",
                "%.fbx",
                "%.jpg",
                "%.jpeg",
                "%.mat",
                "%.meta",
                "%.mixer",
                "%.mp3",
                "%.mp4",
                "%.png",
                "%.otf",
                "%.physicMaterial",
                "%.physicsMaterial",
                "%.prefab",
                "%.preset",
                "%.ttf",
                -- "%.unity",
                "%.wav",
                "%.zip",
            }
        },
        pickers = {
            find_files = {
                theme = "ivy",
                hidden = true,
            },
            live_grep = {
                theme = "ivy",
                hidden = true,
            },
        },
    }

    require("usr.telescope.keymap")

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
end


return M
