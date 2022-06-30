local M = {}

M.components = {
    active = { {}, {}, {} },
    inactive = { {}, {}, {} },
}

M.components.active[1][1] = 
    require("usr.modules.feline.components.full_file_path").get(true)

--[[
    winbar_components.active[1][2] = {
        provider = "diagnostic_errors",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
        end,
        hl = {
            fg = "red",
            style = "bold"
        }
    }

    winbar_components.active[1][3] = {
        provider = "diagnostic_warnings",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
        end,
        hl = {
            fg = "yellow",
            style = "bold"
        }
    }

    winbar_components.active[1][4] = {
        provider = "diagnostic_hints",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
        end,
        hl = {
            fg = "cyan",
            style = "bold"
        }
    }

    winbar_components.active[1][5] = {
        provider = "diagnostic_info",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
        end,
        hl = {
            fg = "skyblue",
            style = "bold"
        }
    }
]]

M.components.inactive[1][1] = 
    require("usr.modules.feline.components.full_file_path").get(false)

return M
