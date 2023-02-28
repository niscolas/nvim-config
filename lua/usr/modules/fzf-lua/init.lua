local M = {}

local setup_keymap = function()
    local keymap = require("usr.modules.fzf-lua.keymap")
    keymap._setup_core_keymap()
    table.insert(
        require("usr.modules.lsp").on_attach_functions,
        keymap._setup_lsp_keymap
    )
end

local setup_hls = function()
    local setup_hls_ok, setup_hls =
        require("usr.themes").try_get_member("fzf_lua_setup_hls")

    if setup_hls_ok then
        setup_hls()
    end
end

M.setup = function()
    local fzf_colors_ok, fzf_colors =
        require("usr.themes").try_get_member("fzf_lua_fzf_colors")

    require("fzf-lua").setup {
        winopts = {
            -- border = false,
            preview = {
                -- border = "noborder",
            },
        },
        fzf_colors = fzf_colors,
    }

    setup_keymap()
    require("fzf-lua").register_ui_select()
    setup_hls()
end

return M
