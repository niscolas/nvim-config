local M = {}

M.setup = function()
    g.firenvim_config = {
        localSettings = {
            [".*"] = {
                takeover = "never",
            },
        },
    }

    local firenvim_active = M.is_env()
    if firenvim_active then
        set.laststatus = 0
    end
end

M.is_env = function()
    local result = g.started_by_firenvim ~= nil
    return result
end

M.is_not_env = function()
    local result = g.started_by_firenvim == nil
    return result
end

return M
