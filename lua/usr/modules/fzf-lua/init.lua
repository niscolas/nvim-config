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

    local keymap = require("usr.modules.fzf-lua.keymap")

    require("fzf-lua").register_ui_select()

    keymap._setup_core_keymap()
    table.insert(
        require("usr.modules.lsp").on_attach_functions,
        keymap._setup_lsp_keymap
    )

    if opts.setup_hls then
        opts.setup_hls()
    end
end

return M
