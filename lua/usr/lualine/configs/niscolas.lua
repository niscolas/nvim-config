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
            {
                "buffers",
                icons_enabled = false,
            },
        },
        lualine_c = {},
        lualine_x = {
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
