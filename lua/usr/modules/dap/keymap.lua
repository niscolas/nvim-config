local vim = vim

vim.keymap.set("n", "<Leader>bc", require("dap").clear_breakpoints)
vim.keymap.set("n", "<Leader>bp", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<Leader>bb", require("dap").continue)
vim.keymap.set("n", "<Leader>bt", require("dap").repl.toggle)
vim.keymap.set("n", "<Leader>bq", require("dap").terminate)

vim.keymap.set("n", "<Leader>bf", require("dapui").float_element)
