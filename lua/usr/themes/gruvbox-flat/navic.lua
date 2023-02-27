local M = {}

M.setup_hl = function()
    local elements = {
        "TypeParameter",
        "Operator",
        "Event",
        "Struct",
        "EnumMember",
        "Null",
        "Key",
        "Object",
        "Array",
        "Boolean",
        "Number",
        "String",
        "Constant",
        "Variable",
        "Function",
        "Interface",
        "Enum",
        "Constructor",
        "Field",
        "Property",
        "Method",
        "Class",
        "Package",
        "Namespace",
        "Module",
        "File",
    }

    local colors = require("usr.themes.gruvbox-flat").colors
    local default_hl = api.nvim_get_hl_by_name("Function", true)

    for _, element in ipairs(elements) do
        local element_hl_ok, element_hl =
            pcall(api.nvim_get_hl_by_name, element, true)

        if not element_hl_ok then
            element_hl = default_hl
        end

        set_hl(
            0,
            "NavicIcons" .. element,
            { default = true, fg = element_hl.foreground, bg = colors.bg }
        )
    end

    set_hl(0, "NavicText", { default = true, fg = colors.fg, bg = colors.bg })
    set_hl(
        0,
        "NavicSeparator",
        { default = true, fg = colors.fg, bg = colors.bg }
    )
end

return M
