return {
    command = {
        provider = require("noice").api.status.command.get,
        enabled = function()
            return require("noice").api.status.command.has()
        end,
    },
    mode = {
        provider = require("noice").api.status.mode.get,
        enabled = function()
            return require("noice").api.status.mode.has()
        end,
        icon = "",
    },
}
