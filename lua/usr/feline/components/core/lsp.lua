return {
    client_names = {
        provider = "lsp_client_names",
        enabled = require("feline.providers.lsp").is_lsp_attached,
        icon = "  ",
    },
    diagnostic_errors = {
        provider = "diagnostic_errors",
        enabled = function()
            return require("feline.providers.lsp").diagnostics_exist(
                vim.diagnostic.severity.ERROR
            )
        end,
    },
    diagnostic_warnings = {
        provider = "diagnostic_warnings",
        enabled = function()
            return require("feline.providers.lsp").diagnostics_exist(
                vim.diagnostic.severity.WARN
            )
        end,
    },
    diagnostic_info = {
        provider = "diagnostic_info",
        enabled = function()
            return require("feline.providers.lsp").diagnostics_exist(
                vim.diagnostic.severity.INFO
            )
        end,
    },
    diagnostic_hints = {
        provider = "diagnostic_hints",
        enabled = function()
            return require("feline.providers.lsp").diagnostics_exist(
                vim.diagnostic.severity.HINT
            )
        end,
    },
}
