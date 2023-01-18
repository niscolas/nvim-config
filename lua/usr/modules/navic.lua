local navic = require("nvim-navic")

navic.setup {
    highlight = true,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true
}

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

for _, element in ipairs(elements) do
    local element_hl_ok, element_hl = pcall(vim.api.nvim_get_hl_by_name, element, true)

    if element_hl_ok then
        vim.pretty_print(element_hl)
        vim.api.nvim_set_hl(0, "NavicIcons" .. element, { default = true, fg = element_hl.foreground })
    end
end

vim.api.nvim_set_hl(0, "NavicText", { default = true, fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, fg = "#ffffff" })
