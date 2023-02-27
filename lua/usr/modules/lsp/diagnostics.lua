local M = {}

local function setup_diagnostic_signs()
    local signs = {
        { name = "DiagnosticSignError", text = niscolas.icons.error },
        { name = "DiagnosticSignWarn", text = niscolas.icons.warning },
        { name = "DiagnosticSignHint", text = niscolas.icons.hint },
        { name = "DiagnosticSignInfo", text = niscolas.icons.info },
    }

    for _, sign in ipairs(signs) do
        fn.sign_define(
            sign.name,
            { texthl = sign.name, text = sign.text, numhl = "" }
        )
    end
end

M.setup = function()
    setup_diagnostic_signs()

    vim.diagnostic.config {
        virtual_text = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
end

return M
