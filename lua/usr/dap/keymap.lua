local vim = vim

vim.keymap.set("n", ",l", function() require("dap").clear_breakpoints() end)
vim.keymap.set("n", ",b", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", ",,", function() require("dap").continue() end)
vim.keymap.set("n", ",r", function() require("dap").repl.toggle() end)
vim.keymap.set("n", ",t", function() require("dap").terminate() end)

vim.keymap.set("n", ",f", function() require("dapui").float_element() end)
