local opts = { noremap = true, silent = true }

-- literally must have
keymap("n", "<left>", function()
    print("use h")
end)
keymap("n", "<right>", function()
    print("use h")
end)
keymap("n", "<up>", function()
    print("use h")
end)
keymap("n", "<down>", function()
    print("use h")
end)

-- sourcing files
keymap("n", "<leader>sv", ":source $MYVIMRC<cr>")
keymap("n", "<leader>sc", ":source %<cr>")
keymap("n", "<leader>ss", ":w<cr> :source %<cr>")

-- replace default redo
keymap("n", "U", "<C-r>", opts)

-- buffer / window navigation
keymap({ "i", "t" }, "<C-\\>", "<C-\\><C-n>", opts)
keymap({ "i", "t" }, "<A-h>", "<C-\\><C-n><C-w>h", opts)
keymap({ "i", "t" }, "<A-j>", "<C-\\><C-n><C-w>j", opts)
keymap({ "i", "t" }, "<A-k>", "<C-\\><C-n><C-w>k", opts)
keymap({ "i", "t" }, "<A-l>", "<C-\\><C-n><C-w>l", opts)
keymap({ "i", "n", "t" }, "<A-q>", "<C-w>q", opts)
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- centering on movement
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

require("usr.core.keymaps.quickfix")
require("usr.core.keymaps.window_resizing")
