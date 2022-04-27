local vim = vim

vim.opt.termguicolors = true
vim.opt.background = "dark"

-- vim.cmd 'highlight Normal guibg=#color guifg=#color'
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_palette = "mix"
vim.g.gruvbox_material_transparent_background = 1

vim.cmd "colorscheme gruvbox-material"

-- vim.cmd "highlight DiagnosticSignError guibg=bg guifg=DiagnosticSignError"
--[[ vim.cmd "highlight link DiagnosticSignWarn GruvboxYellowSign"
vim.cmd "highlight DiagnosticSignWarn guifg=Black" ]]
--[[ vim.cmd "highlight DiagnosticSignInfo guibg=bg guifg=DiagnosticSignInfo"
vim.cmd "highlight DiagnosticSignHint guibg=bg guifg=DiagnosticSignHint"
vim.cmd "highlight SignColumn guibg=bg guifg=SignColumn"
vim.cmd "highlight clear GitSignsAdd guibg"
vim.cmd "highlight GitSignsChange NONE"
vim.cmd "highlight GitSignsDelete NONE" ]]
