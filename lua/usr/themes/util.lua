local M = {}

M.get_fg_from = function(hl_name, rgb)
    local result = get_hl_by_name(hl_name, rgb)
    return result.foreground
end

M.get_bg_from = function(hl_name, rgb)
    local result = get_hl_by_name(hl_name, rgb)
    return result.background
end

return M
