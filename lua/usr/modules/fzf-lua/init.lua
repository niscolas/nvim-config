local M = {}

local setup_keymap = function()
    local keymap = require("usr.modules.fzf-lua.keymap")
    keymap._setup_core_keymap()
    table.insert(
        require("usr.modules.lsp").on_attach_functions,
        keymap._setup_lsp_keymap
    )
end

local setup_hl = function()
    local setup_hl = require("usr.themes").get_field("fzf_lua_setup_hl")
    pcall(setup_hl)
end

M.setup = function()
    local fzf_colors = require("usr.themes").get_field("fzf_lua_fzf_colors")
        or {}

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
    setup_hl()
end

return M
