local cmd = vim.cmd
local set = vim.opt

set.termguicolors = true
set.background = "dark"
cmd [[colorscheme gruvbox]]
cmd [[hi Normal guibg=NONE ctermbg=NONE]]
