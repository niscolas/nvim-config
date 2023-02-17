local vim = vim

keymap("n", "<Leader>bc", require("dap").clear_breakpoints)
keymap("n", "<Leader>bp", require("dap").toggle_breakpoint)
keymap("n", "<Leader>bb", require("dap").continue)
keymap("n", "<Leader>bt", require("dap").repl.toggle)
keymap("n", "<Leader>bq", require("dap").terminate)

keymap("n", "<Leader>bf", require("dapui").float_element)
