local M = {}

M.setup_hl = function()
    local colors = require("usr.themes.gruvbox").get_colors()
    local usr_theme_util = require("usr.themes.util")
    local get_fg_from = usr_theme_util.get_fg_from

    local hl_groups = {
        NavicIconsArray = {
            fg = get_fg_from("NavicIconsArray", true),
            bg = colors.bg,
        },
        NavicIconsBoolean = {
            fg = get_fg_from("NavicIconsBoolean", true),
            bg = colors.bg,
        },
        NavicIconsClass = {
            fg = get_fg_from("NavicIconsClass", true),
            bg = colors.bg,
        },
        NavicIconsConstant = {
            fg = get_fg_from("NavicIconsConstant", true),
            bg = colors.bg,
        },
        NavicIconsConstructor = {
            fg = get_fg_from("NavicIconsConstructor", true),
            bg = colors.bg,
        },
        NavicIconsEnum = {
            fg = get_fg_from("NavicIconsEnum", true),
            bg = colors.bg,
        },
        NavicIconsEnumMember = {
            fg = get_fg_from("NavicIconsEnumMember", true),
            bg = colors.bg,
        },
        NavicIconsEvent = {
            fg = get_fg_from("NavicIconsEvent", true),
            bg = colors.bg,
        },
        NavicIconsField = {
            fg = get_fg_from("NavicIconsField", true),
            bg = colors.bg,
        },
        NavicIconsFile = {
            fg = get_fg_from("NavicIconsFile", true),
            bg = colors.bg,
        },
        NavicIconsFunction = {
            fg = get_fg_from("NavicIconsFunction", true),
            bg = colors.bg,
        },
        NavicIconsInterface = {
            fg = get_fg_from("NavicIconsInterface", true),
            bg = colors.bg,
        },
        NavicIconsKey = {
            fg = get_fg_from("NavicIconsKey", true),
            bg = colors.bg,
        },
        NavicIconsMethod = {
            fg = get_fg_from("NavicIconsMethod", true),
            bg = colors.bg,
        },
        NavicIconsModule = {
            fg = get_fg_from("NavicIconsModule", true),
            bg = colors.bg,
        },
        NavicIconsNamespace = {
            fg = get_fg_from("NavicIconsNamespace", true),
            bg = colors.bg,
        },
        NavicIconsNull = {
            fg = get_fg_from("NavicIconsNull", true),
            bg = colors.bg,
        },
        NavicIconsNumber = {
            fg = get_fg_from("NavicIconsNumber", true),
            bg = colors.bg,
        },
        NavicIconsObject = {
            fg = get_fg_from("NavicIconsObject", true),
            bg = colors.bg,
        },
        NavicIconsOperator = {
            fg = get_fg_from("NavicIconsOperator", true),
            bg = colors.bg,
        },
        NavicIconsPackage = {
            fg = get_fg_from("NavicIconsPackage", true),
            bg = colors.bg,
        },
        NavicIconsProperty = {
            fg = get_fg_from("NavicIconsProperty", true),
            bg = colors.bg,
        },
        NavicIconsString = {
            fg = get_fg_from("NavicIconsString", true),
            bg = colors.bg,
        },
        NavicIconsStruct = {
            fg = get_fg_from("NavicIconsStruct", true),
            bg = colors.bg,
        },
        NavicIconsTypeParameter = {
            fg = get_fg_from("NavicIconsTypeParameter", true),
            bg = colors.bg,
        },
        NavicIconsVariable = {
            fg = get_fg_from("NavicIconsVariable", true),
            bg = colors.bg,
        },
        NavicSeparator = {
            fg = get_fg_from("NavicSeparator", true),
            bg = colors.bg,
        },
        NavicText = {
            fg = get_fg_from("NavicText", true),
            bg = colors.bg,
        },
    }

    set_hls(hl_groups)
end

return M
