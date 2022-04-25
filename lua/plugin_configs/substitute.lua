vim.keymap.set("n", "gr", function() require("substitute").operator() end)
vim.keymap.set("n", "grr", function() require("substitute").line() end)
--[[vim.keymap.set("n", "gr$", function() require("substitute").eol())
vim.keymap.set("x", "s", function() require("substitute").visual()) ]]
