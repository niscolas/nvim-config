local M = {}

_G.usr_require = function(module_name)
    return require("usr." .. module_name)
end

_G.try_usr_require = function (module_name)
    local module_ok, module = pcall(require, "usr." .. module_name)
    return module_ok, module
end

_G.try_require = function(module_name)
    local module_ok, module = pcall(require, module_name)
    return module_ok, module
end

M.get_file_extension = function (file_path)
    local result = vim.fn.fnamemodify(file_path, ":e")
    print(result)
    return result
end

return M
