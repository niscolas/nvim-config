local M = {}

_G.usr_require = function(module_name)
    return require("usr." .. module_name)
end

_G.try_usr_require = function(module_name)
    local module_ok, module = pcall(require, "usr." .. module_name)
    return module_ok, module
end

_G.try_require = function(module_name)
    local module_ok, module = pcall(require, module_name)
    return module_ok, module
end

M.check_is_valid_multi_function = function(functions)
    local result = functions and #functions > 0
    return result
end

M.call_multi_function = function(functions, fallback_function, ...)
    if not M.check_is_valid_multi_function(functions) then
        pcall(fallback_function, ...)
        return
    end

    for _, fn in ipairs(functions) do
        fn(...)
    end
end

M.get_file_extension = function(file_path)
    local result = vim.fn.fnamemodify(file_path, ":e")
    return result
end

return M
