local vim = vim

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_palette = "original"
vim.g.gruvbox_material_transparent_background = 1

vim.cmd "colorscheme gruvbox-material"

local item_kinds = {
"",
"Text",
"Method",
"Function",
"Constructor",
"Field",
"Variable",
"Class",
"Interface",
"Module",
"Property",
"Unit",
"Value",
"Enum",
"Keyword",
"Snippet",
"Color",
"File",
"Reference",
"Folder",
"EnumMember",
"Constant",
"Struct",
"Event",
"Operator",
"TypeParameter",
}

for _, value in ipairs(item_kinds) do
    vim.cmd("highlight link CmpItemKind" .. value .. " AquaBold")
end

vim.cmd([[ 
highlight link CmpItemMenu AquaBold
highlight link VirtualTextError RedSign
highlight link VirtualTextWarning YellowSign
highlight link VirtualTextInfo BlueSign
highlight link VirtualTextHint AquaSign
]])

