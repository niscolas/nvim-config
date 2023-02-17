require("usr.core")
require("usr.modules.util")
require("usr.gui")

local themes = require("usr.themes")
themes.before_plugin()

require("usr.modules").setup()

themes.after_plugin()
