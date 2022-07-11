local vim = vim

--- core
vim.keymap.set("n", "<C-b>", function() require("telescope.builtin").buffers() end)
vim.keymap.set("n", "<C-e>", function() require("telescope.builtin").resume() end)
vim.keymap.set("n", "<C-f>", function() require("telescope.builtin").live_grep() end)
vim.keymap.set("n", "<C-p>", function() require("telescope.builtin").find_files() end)

--- extensions
vim.keymap.set("n", "<leader>tp", function() require("telescope").extensions.project.project {} end)
