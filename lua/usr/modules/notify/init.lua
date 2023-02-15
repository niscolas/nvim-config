local notify = require("notify")

notify.setup {
    background_colour = "#000000",
    render = "minimal",
    top_down = false,
    timeout = 200,
}
vim.notify = notify

-- usr_module_require("notify.recipes")
