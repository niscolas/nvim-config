return {
    branch = {
        provider = "git_branch",
        enabled = function()
            return vim.b.gitsigns_head
        end,
        icon = niscolas.icons.branch .. " ",
    },
    diff_added = {
        provider = "git_diff_added",
    },
    diff_changed = {
        provider = "git_diff_changed",
    },
    diff_removed = {
        provider = "git_diff_removed",
    },
}
