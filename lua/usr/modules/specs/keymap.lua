local opts = { noremap = true, silent = true }
local show_specs_command = ":lua require(\"specs\").show_specs()<CR>"

vim.keymap.set("n", "<C-d>", "<C-d>zz" .. show_specs_command, opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz" .. show_specs_command, opts)
vim.keymap.set("n", "n", "nzzzv" .. show_specs_command, opts)
vim.keymap.set("n", "N", "Nzzzv" .. show_specs_command, opts)
