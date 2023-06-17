new_keymap("n", "gr", require("substitute").operator)
new_keymap("n", "grr", require("substitute").line)
new_keymap("n", "gR", require("substitute").eol)
new_keymap("x", "gr", require("substitute").visual)
