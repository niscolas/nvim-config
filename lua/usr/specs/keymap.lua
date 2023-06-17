local opts = { noremap = true, silent = true }
local show_specs_command = ':lua require("specs").show_specs()<CR>'

new_keymap("n", "<C-d>", "<C-d>zz" .. show_specs_command, opts)
new_keymap("n", "<C-u>", "<C-u>zz" .. show_specs_command, opts)
new_keymap("n", "n", "nzzzv" .. show_specs_command, opts)
new_keymap("n", "N", "Nzzzv" .. show_specs_command, opts)
