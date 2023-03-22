local M = {}

M.colors = {
    bg = "#282828",
    black = "#282828",
    yellow = "#d8a657",
    cyan = "#89b482",
    oceanblue = "#45707a",
    green = "#a9b665",
    orange = "#e78a4e",
    violet = "#d3869b",
    magenta = "#c14a4a",
    white = "#a89984",
    fg = "#a89984",
    skyblue = "#7daea3",
    red = "#ea6962",
}

M.before_plugin = function()
    g.gruvbox_material_background = "soft"
    g.gruvbox_material_palette = "mixed"
    g.gruvbox_material_transparent_background = 1
    g.gruvbox_material_enable_italic = 1
end

return M
