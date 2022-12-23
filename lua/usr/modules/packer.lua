local M = {}

local try_apply_plugin_custom_config = function(plugin)
    if plugin.config ~= nil then
        return plugin
    end

    if type(plugin) == "string" then
        plugin = { plugin }
    end

    plugin.config = function(plugin_name)
        try_usr_module_require(plugin_name)
    end

    return plugin
end

M.setup = function()
    local packer = require("packer")
    local plugins = usr_module_require("plugins")

    packer.startup(function(use)
        for _, plugin in ipairs(plugins) do
            plugin = try_apply_plugin_custom_config(plugin)
            use(plugin)
        end
    end)
end

return M
