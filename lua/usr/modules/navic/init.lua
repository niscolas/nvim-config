local M = {}

M.setup = function()
    local navic = require("nvim-navic")

    navic.setup {
        highlight = true,
        separator = " " .. niscolas.icons.right_arrow .. " ",
        depth_limit = 0,
        depth_limit_indicator = niscolas.icons.three_dots,
        safe_output = true,
    }

    table.insert(
        require("usr.modules.lsp").on_attach_functions,
        require("nvim-navic").attach
    )

    local setup_hl = require("usr.themes").get_field("navic_setup_hl")
    setup_hl()
end

return M
