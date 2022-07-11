_G.module_prefix = "usr.modules."

_G.reqmod = function(module_name)
    return require(module_prefix .. module_name)
end

_G.try_reqmod = function (module_name)
    local module_ok, module = pcall(require, module_prefix .. module_name)
    return module_ok, module
end
