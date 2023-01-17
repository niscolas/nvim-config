local opts = { noremap = true, silent = true }

-- literally must have
vim.keymap.set("n", "<left>", function() print("use h") end)
vim.keymap.set("n", "<right>", function() print("use h") end)
vim.keymap.set("n", "<up>", function() print("use h") end)
vim.keymap.set("n", "<down>", function() print("use h") end)

-- sourcing files
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>sc", ":source %<cr>")
vim.keymap.set("n", "<leader>ss", ":w<cr> :source %<cr>")

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

-- centering on movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- quickfix
vim.keymap.set("n", "\\n", function() vim.cmd("cnext") end, opts)
vim.keymap.set("n", "\\o", function() vim.cmd("copen") end, opts)
vim.keymap.set("n", "\\c", function() vim.cmd("cclose") end, opts)
vim.keymap.set("n", "\\p", function() vim.cmd("cprevious") end, opts)
vim.keymap.set("n", "\\l", function() vim.cmd("cexpr []") end, opts)

require("usr.core.keymaps.window_resizing")
