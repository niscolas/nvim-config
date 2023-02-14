local M = {}

M.setup = function(opts)
    local fzf_colors = opts and opts.fzf_colors or {}

    require("fzf-lua").setup {
        winopts = {
            border = false,
            preview = {
                -- border = "noborder",
            },
        },
        fzf_colors = fzf_colors,
    }

    require("fzf-lua").register_ui_select()
    require("usr.modules.fzf-lua.keymap")

    if opts.setup_hls then
        opts.setup_hls()
    end
end

return M
