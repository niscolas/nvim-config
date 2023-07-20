local M = {}

M.setup = function()
    require("git-conflict").setup {
        default_mappings = {
            ours = "o",
            theirs = "t",
            none = "0",
            both = "b",
        },
    }

    new_keymap("n", "]x", "<Plug>(git-conflict-next-conflict)")
    new_keymap("n", "[x", "<Plug>(git-conflict-prev-conflict)")
end

return M
