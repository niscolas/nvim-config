return {
    command = {
        provider = require("noice").api.status.command.get,
        enabled = require("noice").api.status.command.has,
        icon = "",
    },
    mode = {
        provider = require("noice").api.status.mode.get,
        enabled = require("noice").api.status.mode.has,
        icon = "",
    },
    search = {
        provider = require("noice").api.status.search.get,
        enabled = require("noice").api.status.search.has,
        icon = "",
    },
}
