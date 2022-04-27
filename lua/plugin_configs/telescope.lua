local M = {}

M.config = function()
    require("telescope").setup {
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
        }
    }

    require "keymap.telescope"
end

return M
