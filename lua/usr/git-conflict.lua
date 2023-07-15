local M = {}

M.setup = function()
    require("git-conflict").setup {
        default_mappings = false,
    }

    new_keymap("n", "co", "<Plug>(git-conflict-ours)")
    new_keymap("n", "ct", "<Plug>(git-conflict-theirs)")
    new_keymap("n", "cb", "<Plug>(git-conflict-both)")
    new_keymap("n", "c0", "<Plug>(git-conflict-none)")
    new_keymap("n", "]x", "<Plug>(git-conflict-next-conflict)")
    new_keymap("n", "[x", "<Plug>(git-conflict-prev-conflict)")
end

return M
