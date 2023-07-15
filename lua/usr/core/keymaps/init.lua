local opts = { noremap = true, silent = true }

-- literally must have
new_keymap("n", "<left>", function()
    print("use h")
end)
new_keymap("n", "<right>", function()
    print("use h")
end)
new_keymap("n", "<up>", function()
    print("use h")
end)
new_keymap("n", "<down>", function()
    print("use h")
end)

-- sourcing files
new_keymap("n", "<leader>vv", ":source $MYVIMRC<cr>")
new_keymap("n", "<leader>vc", ":source %<cr>")
new_keymap("n", "<leader>vs", ":w<cr> :source %<cr>")

-- replace default redo
new_keymap("n", "U", "<C-r>", opts)

-- buffer / window navigation
new_keymap({ "i", "t" }, "<C-\\>", "<C-\\><C-n>", opts)
new_keymap({ "i", "t" }, "<A-h>", "<C-\\><C-n><C-w>h", opts)
new_keymap({ "i", "t" }, "<A-j>", "<C-\\><C-n><C-w>j", opts)
new_keymap({ "i", "t" }, "<A-k>", "<C-\\><C-n><C-w>k", opts)
new_keymap({ "i", "t" }, "<A-l>", "<C-\\><C-n><C-w>l", opts)
new_keymap({ "i", "n", "t" }, "<A-q>", "<C-w>q", opts)
new_keymap("n", "<A-h>", "<C-w>h", opts)
new_keymap("n", "<A-j>", "<C-w>j", opts)
new_keymap("n", "<A-k>", "<C-w>k", opts)
new_keymap("n", "<A-l>", "<C-w>l", opts)

-- centering on movement
new_keymap("n", "<C-d>", "<C-d>zz", opts)
new_keymap("n", "<C-u>", "<C-u>zz", opts)
new_keymap("n", "n", "nzzzv", opts)
new_keymap("n", "N", "Nzzzv", opts)

for window_number = 1, 9 do
    local lhs = "<Leader>" .. window_number
    local rhs = window_number .. "<C-w>w"
    vim.keymap.set("n", lhs, rhs, { desc = "Move to window " .. window_number })
end

new_keymap("n", "<Leader>s", ":w<CR>")

require("usr.core.keymaps.quickfix")
require("usr.core.keymaps.window_resizing")
