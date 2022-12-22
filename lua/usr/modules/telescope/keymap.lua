local vim = vim

--- core
vim.keymap.set("n", "<C-b>", require("telescope.builtin").buffers)
vim.keymap.set("n", "<Leader>tr", require("telescope.builtin").resume)
vim.keymap.set("n", "<C-f>", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files)

--- extensions
vim.keymap.set("n", "<Leader>tp", require("telescope").extensions.project.project)
vim.keymap.set("n", "<Leader>e", require("telescope").extensions.file_browser.file_browser)
