local M = {}

M.setup = function()
    local notify = require("notify")

    notify.setup {
        background_colour = "#000000",
        render = "minimal",
        top_down = false,
        timeout = 200,
    }
    vim.notify = notify

    -- require("usr.notify.recipes")
end

return M
