local try_apply_plugin_custom_config = function(plugin)
    if plugin.config ~= nil then
        return plugin
    end

    if type(plugin) == "string" then
        plugin = { plugin }
    end

    print(plugin[1])

    plugin.config = function(plugin_name)
        pcall(require, "usr.modules." .. plugin_name)
    end

    return plugin
end

local packer = nil

if packer == nil then
    packer = require("packer")
    packer.init()
end

packer.reset()

local plugins = require("usr.modules.packer.spec")
local use = packer.use

for _, plugin in ipairs(plugins) do
    plugin = try_apply_plugin_custom_config(plugin)
    use(plugin)
end
