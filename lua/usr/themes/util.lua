local M = {}

M.set_hl_groups = function(value)
    for hl_name, hl_opts in pairs(value) do
        set_hl(0, hl_name, hl_opts)
    end
end

return M
