-- literally must have
vim.keymap.set("n", "<left>", function() print("use h") end)
vim.keymap.set("n", "<right>", function() print("use h") end)
vim.keymap.set("n", "<up>", function() print("use h") end)
vim.keymap.set("n", "<down>", function() print("use h") end)

-- sourcing files
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>sc", ":source %<cr>")
vim.keymap.set("n", "<leader>ss", ":w<cr> :source %<cr>")

local opts = { silent = true }

-- replace default redo
vim.keymap.set("n", "U", "<C-r>", opts)

-- buffer / window navigation
vim.keymap.set({ "i", "t" }, "<C-\\>", "<C-\\><C-n>", opts)
vim.keymap.set({ "i", "t" }, "<A-h>", "<C-\\><C-n><C-w>h", opts)
vim.keymap.set({ "i", "t" }, "<A-j>", "<C-\\><C-n><C-w>j", opts)
vim.keymap.set({ "i", "t" }, "<A-k>", "<C-\\><C-n><C-w>k", opts)
vim.keymap.set({ "i", "t" }, "<A-l>", "<C-\\><C-n><C-w>l", opts)
vim.keymap.set({ "i", "n", "t" }, "<A-q>", "<C-w>q", opts)
vim.keymap.set("n", "<A-h>", "<C-w>h", opts)
vim.keymap.set("n", "<A-j>", "<C-w>j", opts)
vim.keymap.set("n", "<A-k>", "<C-w>k", opts)
vim.keymap.set("n", "<A-l>", "<C-w>l", opts)

require("usr.core.keymaps.quickfix").setup()
require("usr.core.keymaps.window_resizing").setup()
