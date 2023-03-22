local M = {}

M.apply_these_hl_groups = function(value)
    for hl_name, hl_opts in pairs(value) do
        set_hl(0, hl_name, hl_opts)
    end
end

M.get_fg_from = function(hl_name, rgb)
    local result = get_hl_by_name(hl_name, rgb)
    return result.foreground
end

M.get_bg_from = function(hl_name, rgb)
    local result = get_hl_by_name(hl_name, rgb)
    return result.background
end

return M
