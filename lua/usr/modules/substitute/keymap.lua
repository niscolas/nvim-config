vim.keymap.set("n", "gr", require("substitute").operator)
vim.keymap.set("n", "grr", require("substitute").line)
vim.keymap.set("n", "gR", require("substitute").eol)
vim.keymap.set("x", "gr", require("substitute").visual)
