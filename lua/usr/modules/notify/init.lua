local M = {}

M.config = function()
    local notify_ok, notify = pcall(require, "notify")

    if not notify_ok then
        return
    end

    notify.setup{
        background_colour = "#000000",
    }
    vim.notify = notify

    reqmod("notify.recipes")
end

return M
