local M = {}

M._formatters = {}

M._get_format_fn = function()
    return function(bufnr)
        require("usr.core.util").call_multi_function(
            M._formatters,
            vim.lsp.buf.format,
            bufnr
        )
    end
end

return M
