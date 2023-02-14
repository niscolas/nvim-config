vim.keymap.set(
    "n",
    "<C-p>",
    require("fzf-lua").files,
    { desc = "Fzf-Lua [P]roject Files" }
)

vim.keymap.set(
    "n",
    "<C-b>",
    require("fzf-lua").buffers,
    { desc = "Fzf-Lua [B]uffers" }
)

vim.keymap.set(
    "n",
    "<Leader>fr",
    require("fzf-lua").resume,
    { desc = "[F]ind [R]esume" }
)

vim.keymap.set(
    "n",
    "<C-f>",
    require("fzf-lua").grep,
    { desc = "Fzf-Lua Grep ([F]ind)" }
)
