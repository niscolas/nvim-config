local M = {}

M.setup_keymap = function()
    local opts = { silent = true }

    new_keymap("n", "<leader>qq", ":BufDel<CR>", opts)
    new_keymap("n", "<leader>qf", ":BufDel!<CR>", opts)
    new_keymap("n", "<leader>qaa", ":BufDelAll<CR>", opts)
    new_keymap("n", "<leader>qaf", ":BufDelAll!<CR>", opts)
    new_keymap("n", "<leader>qoo", ":BufDelOthers<CR>", opts)
    new_keymap("n", "<leader>qof", ":BufDelOthers!<CR>", opts)
end

M.setup = function()
    require("bufdel").setup()
    M.setup_keymap()
end

return M
