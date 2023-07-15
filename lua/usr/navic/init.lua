local M = {}

local on_attach = function(client, bufnr)
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)

    local setup_hl = require("usr.themes").get_field("navic_setup_hl")
    setup_hl()
end

M.setup = function()
    local navic = require("nvim-navic")

    navic.setup {
        highlight = true,
        separator = " " .. niscolas.icons.right_arrow .. " ",
        depth_limit = 0,
        depth_limit_indicator = niscolas.icons.three_dots,
        safe_output = true,
    }

    require("usr.lsp.handlers").add_post_on_attach_callback(on_attach)
end

return M
