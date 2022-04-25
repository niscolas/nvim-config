-- literally must have
vim.keymap.set("n", "<left>", function() print("use h") end)
vim.keymap.set("n", "<right>", function() print("use h") end)
vim.keymap.set("n", "<up>", function() print("use h") end)
vim.keymap.set("n", "<down>", function() print("use h") end)

-- fix capital Y
vim.keymap.set("n", "Y", "y$")

vim.keymap.set("n", "\\v", ":source $MYVIMRC<cr>")

-- replace default redo
vim.keymap.set("n", "U", "<c-r>")

-- clear search
vim.keymap.set("n", "<cr>", ":noh<cr><cr>")

-- editing files
vim.keymap.set("n", "<leader>s", ":w<cr>")
vim.keymap.set("n", "<leader>qq", ":Bdelete<cr>")
vim.keymap.set("n", "<leader>qa", ":bufdo Bdelete<cr>")

-- easy buffer navigation
vim.keymap.set("n", "<a-l>", ":bnext<cr>")
vim.keymap.set("n", "<a-h>", ":bprevious<cr>")

-- window resizing
vim.g.resize_amount = 20
vim.keymap.set("n", "\\j", ":exe \"resize -\" . (g:resize_amount)<cr>")
vim.keymap.set("n", "\\k", ":exe \"resize +\" . (g:resize_amount)<cr>")
vim.keymap.set("n", "\\h", ":exe \"vertical resize +\" . (g:resize_amount)<cr>")
vim.keymap.set("n", "\\l", ":exe \"vertical resize -\" . (g:resize_amount)<cr>")

