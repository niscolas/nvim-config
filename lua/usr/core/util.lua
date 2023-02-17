local M = {}

_G.api = vim.api
_G.clear_autocmd = api.nvim_clear_autocmds
_G.cmd = vim.cmd
_G.del_keymap = del_keymap
_G.fn = vim.fn
_G.new_augroup = api.nvim_create_augroup
_G.new_autocmd = api.nvim_create_autocmd
_G.new_keymap = vim.keymap.set
_G.new_user_command = api.nvim_create_user_command
_G.set = vim.opt
_G.set_hl = api.nvim_set_hl

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
    local result = fn.fnamemodify(file_path, ":e")
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
