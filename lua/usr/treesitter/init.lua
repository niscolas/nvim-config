local M = {}

M.nu = function()
    local parser_config =
        require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.nu = {
        install_info = {
            url = "https://github.com/nushell/tree-sitter-nu",
            files = { "src/parser.c" },
            branch = "main",
        },
        filetype = "nu",
    }
end

M.setup = function()
    M.nu()

    local nvim_treesiter_configs = require("nvim-treesitter.configs")
    nvim_treesiter_configs.setup {
        ensure_installed = {
            "c_sharp",
            "cpp",
            "gdscript",
            "lua",
            "markdown",
            "norg",
            "nu",
            "regex",
            "ron",
            "rust",
            "vim",
            "yaml",
        },
        highlight = {
            enable = true,
            disable = { "vim" },
            additional_vim_regex_highlighting = false,
        },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?",
            },
        },
        matchup = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                },
            },
        },
    }
end

return M
