local vim = vim

vim.keymap.set("n", "<Leader>bc", function() require("dap").clear_breakpoints() end)
vim.keymap.set("n", "<Leader>bb", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>br", function() require("dap").continue() end)
vim.keymap.set("n", "<Leader>bt", function() require("dap").repl.toggle() end)
vim.keymap.set("n", "<Leader>bq", function() require("dap").terminate() end)

vim.keymap.set("n", "<Leader>bf", function() require("dapui").float_element() end)
