local opts = { silent = true }

vim.keymap.set("n", "\\n", function() vim.cmd("cnext") end, opts)
vim.keymap.set("n", "\\o", function() vim.cmd("copen") end, opts)
vim.keymap.set("n", "\\c", function() vim.cmd("cclose") end, opts)
vim.keymap.set("n", "\\p", function() vim.cmd("cprevious") end, opts)
vim.keymap.set("n", "\\l", function() vim.cmd("cexpr []") end, opts)
