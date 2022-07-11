_G.try_req = function(module_name)
    local module_ok, module = pcall(require, module_name)
    return module_ok, module
end
