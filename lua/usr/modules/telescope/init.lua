local telescope = require("telescope")
local usr_telescope_core = require("usr.modules.telescope.core")

telescope.setup(usr_telescope_core.setup_opts)

require("usr.modules.telescope.keymap").load_core_keymap()
require("usr.modules.telescope.commands")

telescope.load_extension("fzf")

require("usr.modules.telescope.keymap").load_extensions_keymap()
