local default_config = "gruvbox-flat"
local config = niscolas.colorscheme.feline_theme or default_config

require("usr.modules.feline.configs." .. config).setup()
