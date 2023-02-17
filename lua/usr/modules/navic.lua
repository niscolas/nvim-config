local navic = require("nvim-navic")

navic.setup {
    highlight = true,
    separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = "󰇘",
    safe_output = true,
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
    local element_hl_ok, _ = pcall(vim.api.nvim_get_hl_by_name, element, true)

    local linked_element = "Function"

    if element_hl_ok then
        linked_element = element
    end

    vim.api.nvim_set_hl(
        0,
        "NavicIcons" .. element,
        { default = true, link = linked_element }
    )
end

vim.api.nvim_set_hl(0, "NavicText", { default = true, link = "NormalNC" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, link = "NormalNC" })

table.insert(
    require("usr.modules.lsp").on_attach_functions,
    require("nvim-navic").attach
)
