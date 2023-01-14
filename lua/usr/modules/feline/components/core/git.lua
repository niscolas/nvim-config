return {
    branch = {
        provider = {
            name = "git_branch"
        },
        hl = {
            fg = "#FFFFFF"
        },
        right_sep = {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'black'
            }
        }
    },
    diff_added = {
        provider = "git_diff_added",
    },
    diff_changed = {
        provider = "git_diff_changed",
    },
    diff_removed = {
        provider = "git_diff_removed",
    }
}
