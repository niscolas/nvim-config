local M = {}

M.join_into_hl_table = function(value)
    local hl = {}
    hl = join_tables_forced(hl, value)

    return {
        hl = hl,
    }
end

M.get_joined_bg_hl_table = function(color)
    return join_tables_forced { bg = color }
end

return M
