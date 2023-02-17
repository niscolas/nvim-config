local default_theme = "gruvbox-flat"
local theme = niscolas.theme.feline_theme_name or default_theme

require("usr.modules.feline.themes." .. theme).setup()
