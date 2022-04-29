local vim = vim

-- vim.keymap.set("n", "<leader>d", function() require('dap').step_into() end)
-- vim.keymap.set("n", "<C-o>", function() require('dap').step_over() end)
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dro", function() require("dap").repl.open() end)
vim.keymap.set("n", "<leader>drc", function() require("dap").repl.close() end)
vim.keymap.set("n", "<leader>drt", function() require("dap").repl.toggle() end)
-- vim.keymap.set("n", "<leader>ds", function() require('user.dap').open_sidebar_scopes() end)
