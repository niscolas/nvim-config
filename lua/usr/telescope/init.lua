local telescope = require("telescope")
local usr_telescope_core = require("usr.telescope.core")

telescope.setup(usr_telescope_core.setup_opts)

require("usr.telescope.commands")
require("usr.telescope.keymap").load_core_keymap()

telescope.load_extension("fzf")

require("usr.telescope.keymap").load_extensions_keymap()

require("usr.lsp.handlers").add_post_on_attach_callback(
    require("usr.telescope.keymap").setup_lsp_on_attach_keymap
)
