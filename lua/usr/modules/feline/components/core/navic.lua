local navic = require("nvim-navic")

return {
    provider = function()
        return navic.get_location()
    end,
    enabled = function()
        return navic.is_available()
    end,
    hl = {
        bg = "bg"
    }
}
