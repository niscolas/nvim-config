local M = {}

local setup_keymap = function()
    local keymap = require("usr.fzf-lua.keymap")
    keymap._setup_core_keymap()
    require("usr.lsp.handlers").add_post_on_attach_callback(
        keymap._setup_lsp_keymap
    )
end

local get_fzf_colors = function()
    local get_fzf_colors =
        require("usr.themes").get_field("fzf_lua_get_fzf_colors")
    local result = get_fzf_colors and get_fzf_colors() or {}

    return result
end

local get_hl = function()
    local get_hl = require("usr.themes").get_field("fzf_lua_get_hl")
    local result = get_hl and get_hl() or {}

    return result
end

M.init = function()
    setup_keymap()
end

M.setup = function()
    local fzf_colors = get_fzf_colors()
    local hl = get_hl()

    require("fzf-lua").setup {
        fzf_colors = fzf_colors,
        keymap = {
            fzf = {
                ["tab"] = "down",
                ["shift-tab"] = "up",
                ["ctrl-n"] = "toggle+down",
                ["ctrl-p"] = "toggle+up",
            },
        },
        winopts = {
            hl = hl,
        },
    }

    require("fzf-lua").register_ui_select()
end

return M
