local vim = vim

--- core
vim.keymap.set("n", "<leader>tb", function() require("telescope.builtin").buffers() end)
vim.keymap.set("n", "<leader>te", function() require("telescope.builtin").resume() end)
vim.keymap.set("n", "<leader>tf", function() require("telescope.builtin").live_grep() end)
vim.keymap.set("n", "<leader>tp", function() require("telescope.builtin").find_files() end)

--- extensions
vim.keymap.set("n", "<leader>tj", function() require("telescope").extensions.project.project {} end)
