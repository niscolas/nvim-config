local M = {}

local colors = require("usr.themes.gruvbox").get_colors()

local hl_groups = {
    -- NavicIconsArray = { copy_fg = "NavicIconsArray", bg = colors.bg0 },
    -- NavicIconsBoolean = { copy_fg = "NavicIconsBoolean", bg = colors.bg0 },
    NavicIconsClass = { default = true, bg = colors.bg0 },
    NavicIconsConstant = { default = true, bg = colors.bg0 },
    NavicIconsConstructor = { default = true, bg = colors.bg0 },
    NavicIconsEnum = { default = true, bg = colors.bg0 },
    NavicIconsEnumMember = { default = true, bg = colors.bg0 },
    NavicIconsEvent = { default = true, bg = colors.bg0 },
    NavicIconsField = { default = true, bg = colors.bg0 },
    NavicIconsFile = { default = true, bg = colors.bg0 },
    NavicIconsFunction = { default = true, bg = colors.bg0 },
    NavicIconsInterface = { default = true, bg = colors.bg0 },
    NavicIconsKey = { default = true, bg = colors.bg0 },
    NavicIconsMethod = { default = true, bg = colors.bg0 },
    NavicIconsModule = { default = true, bg = colors.bg0 },
    NavicIconsNamespace = { default = true, bg = colors.bg0 },
    NavicIconsNull = { default = true, bg = colors.bg0 },
    NavicIconsNumber = { default = true, bg = colors.bg0 },
    NavicIconsObject = { default = true, bg = colors.bg0 },
    NavicIconsOperator = { default = true, bg = colors.bg0 },
    NavicIconsPackage = { default = true, bg = colors.bg0 },
    NavicIconsProperty = { default = true, bg = colors.bg0 },
    NavicIconsString = { default = true, bg = colors.bg0 },
    NavicIconsStruct = { default = true, bg = colors.bg0 },
    NavicIconsTypeParameter = { default = true, bg = colors.bg0 },
    NavicIconsVariable = { default = true, bg = colors.bg0 },
    NavicSeparator = { default = true, bg = colors.bg0 },
    NavicText = { default = true, bg = colors.bg0 },
}

M.setup_hl = function()
    require("usr.themes.util").set_hl_groups(hl_groups)
end

return M
