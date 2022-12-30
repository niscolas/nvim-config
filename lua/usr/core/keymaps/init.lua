-- literally must have
vim.keymap.set("n", "<left>", function() print("use h") end)
vim.keymap.set("n", "<right>", function() print("use h") end)
vim.keymap.set("n", "<up>", function() print("use h") end)
vim.keymap.set("n", "<down>", function() print("use h") end)

-- sourcing files
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>sc", ":source %<cr>")
vim.keymap.set("n", "<leader>ss", ":w<cr> :source %<cr>")

local silent_opts = { silent = true }

-- replace default redo
vim.keymap.set("n", "U", "<C-r>", silent_opts)

-- buffer / window navigation
vim.keymap.set({ "i", "t" }, "<C-\\>", "<C-\\><C-n>", silent_opts)
vim.keymap.set({ "i", "t" }, "<A-h>", "<C-\\><C-n><C-w>h", silent_opts)
vim.keymap.set({ "i", "t" }, "<A-j>", "<C-\\><C-n><C-w>j", silent_opts)
vim.keymap.set({ "i", "t" }, "<A-k>", "<C-\\><C-n><C-w>k", silent_opts)
vim.keymap.set({ "i", "t" }, "<A-l>", "<C-\\><C-n><C-w>l", silent_opts)
vim.keymap.set({ "i", "n", "t" }, "<A-q>", "<C-w>q", silent_opts)
vim.keymap.set("n", "<A-h>", "<C-w>h", silent_opts)
vim.keymap.set("n", "<A-j>", "<C-w>j", silent_opts)
vim.keymap.set("n", "<A-k>", "<C-w>k", silent_opts)
vim.keymap.set("n", "<A-l>", "<C-w>l", silent_opts)

-- centerin on movement
--[[ vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz") ]]
--[[ vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv") ]]

-- quickfix
vim.keymap.set("n", "\\n", function() vim.cmd("cnext") end, opts)
vim.keymap.set("n", "\\o", function() vim.cmd("copen") end, opts)
vim.keymap.set("n", "\\c", function() vim.cmd("cclose") end, opts)
vim.keymap.set("n", "\\p", function() vim.cmd("cprevious") end, opts)
vim.keymap.set("n", "\\l", function() vim.cmd("cexpr []") end, opts)

usr_require("core.keymaps.window_resizing")
