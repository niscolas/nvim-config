local vim = vim

--- core
vim.keymap.set("n", "<c-p>", function() require("telescope.builtin").find_files() end)
vim.keymap.set("n", "<c-f>", function() require("telescope.builtin").live_grep() end)

--- lsp
vim.keymap.set("n", "<leader>tw", function() require("telescope.builtin").diagnostics() end)
vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end)
vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end)
vim.keymap.set("n", "gi", function() require("telescope.builtin").lsp_implementations() end)

--- extensions
vim.keymap.set("n", "<leader>tp", function() require("telescope").extensions.project.project {} end)
