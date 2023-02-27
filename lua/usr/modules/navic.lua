local navic = require("nvim-navic")

navic.setup {
    highlight = true,
    separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = "󰇘",
    safe_output = true,
}

table.insert(
    require("usr.modules.lsp").on_attach_functions,
    require("nvim-navic").attach
)

local setup_hl_fn_ok, setup_hl_fn =
    require("usr.themes").try_get_member("navic_setup_highlight")

if not setup_hl_fn_ok or not setup_hl_fn then
    return
end

setup_hl_fn()
