local vim = vim

--- core
vim.keymap.set("n", "<leader>tp", function() require("telescope.builtin").find_files() end)
vim.keymap.set("n", "<leader>tf", function() require("telescope.builtin").live_grep() end)
vim.keymap.set("n", "<leader>te", function() require("telescope.builtin").resume() end)

--- lsp
vim.keymap.set("n", "<leader>td", function() require("telescope.builtin").diagnostics() end)
vim.keymap.set("n", "<leader>ts", function() require("telescope.builtin").lsp_document_symbols() end)
vim.keymap.set("n", "gd", function() require("omnisharp_extended").telescope_lsp_definitions() end)
vim.keymap.set("n", "<leader>tr", function() require("telescope.builtin").lsp_references() end)
vim.keymap.set("n", "<leader>ti", function() require("telescope.builtin").lsp_implementations() end)

--- extensions
vim.keymap.set("n", "<leader>tj", function() require("telescope").extensions.project.project {} end)
