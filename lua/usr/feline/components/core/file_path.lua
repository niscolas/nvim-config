local get_icon = function()
    return require("nvim-web-devicons").get_icon_color(
        fn.expand("%:t"),
        nil,
        { default = true }
    )
end

local M = {}
M.simple = {
    provider = {
        name = "file_info",
        opts = {
            file_readonly_icon = niscolas.icons.lock .. " ",
            type = "relative",
        },
    },
}

M.color = {
    provider = {
        name = "file_info",
        opts = {
            colored_icon = false,
            file_readonly_icon = niscolas.icons.lock .. " ",
            type = "unique-short",
        },
    },
    hl = function()
        local _, icon_color = get_icon()

        return {
            fg = "bg",
            bg = icon_color,
            style = "bold",
        }
    end,
}

return M
