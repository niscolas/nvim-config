local M = {}

local formatters = {}
local formatter_count = 0

M.append_formatter = function(formatter)
    if not formatter then
        return
    end

    table.insert(formatters, formatter)
    formatter_count = formatter_count + 1
end

M.get_format_fn = function()
    if formatter_count == 0 then
        return vim.lsp.buf.format
    end

    return function(bufnr)
        for _, formatter in ipairs(formatters) do
            formatter(bufnr)
        end
    end
end

return M
