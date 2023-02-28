local M = {}

M.setup_hl = function()
    local colors = require("usr.themes.gruvbox-flat").colors

    local hls = {
        CmpItemAbbrDeprecated = {
            fg = colors.bg_highlight,
            strikethrough = true,
        },
        CmpItemAbbrMatchDefault = {
            default = false,
            fg = colors.yellow,
            bold = true,
        },
        CmpItemAbbrMatchFuzzyDefault = { link = "CmpItemAbbrMatchDefault" },
        CmpItemKindClass = { link = "Structure" },
        CmpItemKindColor = { link = "@interface" },
        CmpItemKindConstant = { link = "Constant" },
        CmpItemKindConstructor = { link = "TSConstructor" },
        CmpItemKindEnum = { link = "String" },
        CmpItemKindEnumMember = { link = "@enumMember" },
        CmpItemKindEvent = { link = "TSProperty" },
        CmpItemKindField = { link = "TSProperty" },
        CmpItemKindFile = { link = "TSProperty" },
        CmpItemKindFolder = { link = "Statement" },
        CmpItemKindFunction = { link = "Function" },
        CmpItemKindInterface = { link = "@interface" },
        CmpItemKindKeyword = { link = "String" },
        CmpItemKindMethod = { link = "@method" },
        CmpItemKindModule = { link = "Structure" },
        CmpItemKindOperator = { link = "Operator" },
        CmpItemKindProperty = { link = "TSProperty" },
        CmpItemKindReference = { link = "Constant" },
        CmpItemKindSnippet = { link = "Statement" },
        CmpItemKindStruct = { link = "Structure" },
        CmpItemKindText = { link = "String" },
        CmpItemKindTypeParameter = { link = "@typeParameter" },
        CmpItemKindUnit = { link = "Statement" },
        CmpItemKindValue = { link = "@method" },
        CmpItemKindVariable = { link = "TSProperty" },
        CmpItemMenu = { fg = colors.yellow, italic = true },
    }

    for hl_name, hl_opts in pairs(hls) do
        set_hl(0, hl_name, hl_opts)
    end
end

return M
