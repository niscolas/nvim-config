_G.usr_require = function(module_name)
    return require("usr." .. module_name)
end

_G.try_require = function(module_name)
    local module_ok, module = pcall(require, module_name)
    return module_ok, module
end
