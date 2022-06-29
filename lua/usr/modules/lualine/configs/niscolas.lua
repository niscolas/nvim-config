require("lualine").setup {
    options = {
        always_divide_middle = false,
        component_separators = "|",
        disabled_filetypes = {},
        globalstatus = true,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        theme = "gruvbox",
    },
    sections = {
        lualine_a = {
            {
                "mode",
            }
        },
        lualine_b = {
        },
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " ",
                    readonly = " ",
                    unnamed = "[No Name]",
                },
            },
            {
                "filetype",
                icon_only = true
            },
            "encoding",
            {
                "fileformat",
                symbols = {
                    unix = "", -- e712
                    dos = "", -- e70f
                    mac = "", -- e711
                }
            }
        },
        lualine_x = {},
        lualine_y = {
            {
                "branch",
                icon = "שׂ"
            },
            {
                "diff",
                symbols = { added = " ", modified = " ", removed = " " }
            },
            {
                "diagnostics",
                sources = { "nvim_diagnostic", "nvim_lsp" },
                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = "ErrorFloat", -- Changes diagnostics' error color.
                    warn  = "WarningFloat", -- Changes diagnostics' warn color.
                    info  = "InfoFloat", -- Changes diagnostics' info color.
                    hint  = "HintFloat", -- Changes diagnostics' hint color.
                },
            },
        },
        lualine_z = { "location", }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
