require("fzf-lua").setup {
    winopts = {
        border = false,
        preview = {
            -- border = "noborder",
        },
    },
}

require("fzf-lua").register_ui_select()

require("usr.colors").load_colors_for("fzf-lua")
