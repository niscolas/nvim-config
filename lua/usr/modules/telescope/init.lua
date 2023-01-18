local telescope = require("telescope")
local usr_telescope_core = require("usr.modules.telescope.core")

telescope.setup(usr_telescope_core.setup_opts)

require("usr.modules.telescope.keymap").setup()
require("usr.modules.telescope.commands")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
