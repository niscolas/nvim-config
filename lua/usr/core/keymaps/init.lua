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
vim.keymap.set("n", "U", "<c-r>", opts)

-- buffer / window navigation
vim.keymap.set({ "i", "t" }, "<a-h>", "<c-\\><c-n><c-w>h", opts)
vim.keymap.set({ "i", "t" }, "<a-j>", "<c-\\><c-n><c-w>j", opts)
vim.keymap.set({ "i", "t" }, "<a-k>", "<c-\\><c-n><c-w>k", opts)
vim.keymap.set({ "i", "t" }, "<a-l>", "<c-\\><c-n><c-w>l", opts)
vim.keymap.set({ "i", "n", "t" }, "<a-q>", "<c-w>q", opts)
vim.keymap.set("n", "<a-h>", "<c-w>h", opts)
vim.keymap.set("n", "<a-j>", "<c-w>j", opts)
vim.keymap.set("n", "<a-k>", "<c-w>k", opts)
vim.keymap.set("n", "<a-l>", "<c-w>l", opts)
vim.keymap.set("n", "<a-s-l>", ":bnext<cr>", opts)
vim.keymap.set("n", "<a-s-h>", ":bprevious<cr>", opts)

require("usr.core.keymaps.window_resizing").setup()
