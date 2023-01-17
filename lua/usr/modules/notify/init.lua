local notify = require("notify")

notify.setup{
    background_colour = "#000000",
    render = "minimal",
    top_down = false,
}
vim.notify = notify

-- usr_module_require("notify.recipes")
