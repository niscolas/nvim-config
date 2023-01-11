local M = {}

M.default_left_separator = " "
M.default_right_separator = " "

M.force_inactive = {
    filetypes = {
        "NvimTree",
        "aerial",
        "dbui",
        "fugitive",
        "fugitiveblame",
        "minpacprgs",
        "neo-tree",
        "packer",
        "qf",
        "startify",
    },
    buftypes = {
        "terminal"
    },
    bufnames = {}
}

M.theme = niscolas.colorscheme.feline_theme or { }

return M
