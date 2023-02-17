local navic = require("nvim-navic")

return {
    provider = navic.get_location,
    enabled = navic.is_available,
}
