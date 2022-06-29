local notify = require("notify")
notify.setup{
    background_colour = "#000000",
}
vim.notify = notify
require("usr.modules.notify.recipes")
