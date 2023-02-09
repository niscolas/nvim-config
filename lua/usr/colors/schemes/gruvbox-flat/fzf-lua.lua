local colors = require("usr.colors.schemes.gruvbox-flat").colors

vim.api.nvim_set_hl(0, "FzfLuaNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "FzfLuaCursor", { link = "Cursor" })
vim.api.nvim_set_hl(0, "FzfLuaCursorLine", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "FzfLuaCursorLineNr", { link = "CursorLineNr" })
vim.api.nvim_set_hl(0, "FzfLuaSearch", { link = "IncSearch" })
vim.api.nvim_set_hl(0, "FzfLuaTitle", { link = "FzfLuaNormal" })
vim.api.nvim_set_hl(0, "FzfLuaScrollBorderEmpty", { link = "FzfLuaBorder" })
vim.api.nvim_set_hl(0, "FzfLuaScrollBorderFull", { link = "FzfLuaBorder" })
vim.api.nvim_set_hl(0, "FzfLuaScrollFloatEmpty", { link = "PmenuSbar" })
vim.api.nvim_set_hl(0, "FzfLuaScrollFloatFull", { link = "PmenuThumb" })
vim.api.nvim_set_hl(0, "FzfLuaHelpNormal", { link = "FzfLuaNormal" })
vim.api.nvim_set_hl(0, "FzfLuaHelpBorder", { link = "FzfLuaBorder" })
