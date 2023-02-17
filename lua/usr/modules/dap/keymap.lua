local vim = vim

new_keymap("n", "<Leader>bc", require("dap").clear_breakpoints)
new_keymap("n", "<Leader>bp", require("dap").toggle_breakpoint)
new_keymap("n", "<Leader>bb", require("dap").continue)
new_keymap("n", "<Leader>bt", require("dap").repl.toggle)
new_keymap("n", "<Leader>bq", require("dap").terminate)

new_keymap("n", "<Leader>bf", require("dapui").float_element)
