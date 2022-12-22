local ignored_extensions = {
    "anim",
    "asmdef",
    "asset",
    "bank",
    "clip",
    "controller",
    "csproj",
    "dll",
    "fbx",
    "jpg",
    "jpeg",
    "lightning",
    "mat",
    "meta",
    "mixer",
    "mp3",
    "mp4",
    "png",
    "otf",
    "physicMaterial",
    "physicsMaterial",
    "prefab",
    "preset",
    "ttf",
    "ttf",
    "unity",
    "wav",
    "zip",
}

local function get_file_ignore_patterns()
    local file_ignore_patterns = {
        ".git/",
        "node_modules",
        "[Ll]ibrary",
    }

    for _, extension in ipairs(ignored_extensions) do
        table.insert(file_ignore_patterns, "%." .. extension .. "$")
        table.insert(file_ignore_patterns, "%." .. string.upper(extension) .. "$")
    end

    return file_ignore_patterns
end

local telescope_ok, telescope = pcall(require, "telescope")

if not telescope_ok then
    return
end

local default_mappings = {
    ["<C-n>"] = function(opts)
        require("telescope.actions").toggle_selection(opts)
        require("telescope.actions").move_selection_next(opts)
    end,
    ["<C-p>"] = function(opts)
        require("telescope.actions").toggle_selection(opts)
        require("telescope.actions").move_selection_previous(opts)
    end,
    ["<Tab>"] = function(opts)
        require("telescope.actions").move_selection_next(opts)
    end,
    ["<S-tab>"] = function(opts)
        require("telescope.actions").move_selection_previous(opts)
    end,
}

telescope.setup {
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
        project = {},
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
        file_ignore_patterns = get_file_ignore_patterns(),
        mappings = {
            n = default_mappings,
            i = default_mappings,
        },
    },
    pickers = {
        find_files = {},
        live_grep = {},
        diagnostics = {},
        lsp_document_symbols = {},
        lsp_definitions = {},
        lsp_implementations = {},
        lsp_references = {},
    },
}

usr_module_require("telescope.keymap")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
