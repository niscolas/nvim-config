local M = {}

M.components = {
    active = {
        {
            {
                provider = require(
                    "usr.modules.feline.components.core.file_path"
                ).provider,
                left_sep = " ",
            },
        },
        {},
        {},
    },
}

M.components.inactive = M.components.active

return M
