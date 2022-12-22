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
    local packer_ok, packer = try_require("packer")
    local plugins_ok, plugins = try_usr_module_require("plugins")

    if not plugins_ok or
        not packer_ok then
        return
    end

    packer.startup(function(use)
        for _, plugin in ipairs(plugins) do
            plugin = try_apply_plugin_custom_config(plugin)
            use(plugin)
        end
    end)
end

return M
