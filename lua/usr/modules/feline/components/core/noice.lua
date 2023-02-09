return {
    command = {
        provider = require("noice").api.status.command.get,
        enabled = function()
            return require("noice").api.status.command.has()
        end,
        icon = "",
    },
    mode = {
        provider = require("noice").api.status.mode.get,
        enabled = function()
            return require("noice").api.status.mode.has()
        end,
        icon = "",
    },
    search = {
        provider = require("noice").api.status.search.get,
        enabled = require("noice").api.status.search.has,
        icon = "",
    },
}
