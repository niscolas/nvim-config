local lsp = require("feline.providers.lsp")
local usr_feline_util = require("usr.modules.feline.util")

local M = {}

M.components = {
    active = { {}, {}, {} },
    inactive = { {}, {}, {} },
}

M.components.active[1][1] = {
    hl = {
        bg = "skyblue",
        fg = "black",
        style = "bold",
    },
    left_sep = {
        hl = {
            bg = "skyblue",
        },
        str = " ",
    },
    provider = require("usr.modules.feline.components.aerial"),
    right_sep = {
        hl = {
            bg = usr_feline_util.theme.bg,
            fg = "skyblue",
        },
        str = usr_feline_util.default_right_separator,
    }
}
M.components.active[1][2] = {
    provider = "lsp_client_names",
    hl = {
        fg = "yellow",
        style = "bold"
    },
}

M.components.active[1][3] = {
    provider = "diagnostic_errors",
    enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
    end,
    hl = {
        fg = "red",
        style = "bold"
    }
}

M.components.active[1][4] = {
    provider = "diagnostic_warnings",
    enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
    end,
    hl = {
        fg = "yellow",
        style = "bold"
    }
}

M.components.active[1][5] = {
    provider = "diagnostic_hints",
    enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
    end,
    hl = {
        fg = "cyan",
        style = "bold"
    }
}

M.components.active[1][6] = {
    provider = "diagnostic_info",
    enabled = function()
        return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
    end,
    hl = {
        fg = "skyblue",
        style = "bold"
    }
}

M.components.inactive[1][1] = {
    hl = {
        bg = "white",
        fg = "black",
    },
    left_sep = {
        hl = {
            bg = "white",
        },
        str = " ",
    },
    provider = require("usr.modules.feline.components.aerial"),
    right_sep = {
        hl = {
            bg = usr_feline_util.theme.bg,
            fg = "white",
        },
        str = usr_feline_util.default_right_separator,
    }
}


return M
