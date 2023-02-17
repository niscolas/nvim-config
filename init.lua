require("usr.core")
require("usr.gui")

local themes = require("usr.themes")
themes.before_plugin()

require("usr.modules").setup()

themes.after_plugin()
