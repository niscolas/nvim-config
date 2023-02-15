local telescope = require("telescope")
local usr_telescope_core = require("usr.modules.telescope.core")

telescope.setup(usr_telescope_core.setup_opts)

require("usr.modules.telescope.commands")
require("usr.modules.telescope.keymap").load_core_keymap()

telescope.load_extension("fzf")

require("usr.modules.telescope.keymap").load_extensions_keymap()

table.insert(
    require("usr.modules.lsp").on_attach_functions,
    require("usr.modules.telescope.keymap").setup_lsp_on_attach_keymap
)
