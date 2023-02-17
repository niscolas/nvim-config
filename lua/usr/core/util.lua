local M = {}

_G.autocmd = vim.api.nvim_create_autocmd
_G.augroup = vim.api.nvim_create_augroup
_G.clear_autocmd = vim.api.nvim_clear_autocmds
_G.keymap = vim.keymap.set

_G.try_require = function(module_name)
    local module_ok, module = pcall(require, module_name)
    return module_ok, module
end

_G.join_tables_forced = function(...)
    return vim.tbl_deep_extend("force", ...)
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

M.check_is_personal_setup = function()
    local setup = niscolas.settings.setup

    if setup == nil then
        return false
    end

    local result = setup == "personal"
    return result
end

return M
