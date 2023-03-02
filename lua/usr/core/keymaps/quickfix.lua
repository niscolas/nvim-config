local base_opts = { noremap = true, silent = true }

new_keymap("n", "\\n", function()
    cmd("cnext")
end, join_tables_forced(base_opts, { desc = "Quickfix [N]ext" }))

new_keymap("n", "\\p", function()
    cmd("cprevious")
end, join_tables_forced(base_opts, { desc = "Quickfix [P]revious" }))

new_keymap("n", "\\o", function()
    cmd("copen")
end, join_tables_forced(base_opts, { desc = "Quickfix [O]pen" }))

new_keymap("n", "\\c", function()
    cmd("cclose")
end, join_tables_forced(base_opts, { desc = "Quickfix [C]lose" }))

new_keymap("n", "\\l", function()
    cmd("cexpr []")
end, join_tables_forced(base_opts, { desc = "Quickfix C[l]ear" }))
