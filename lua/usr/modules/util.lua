local M = {}

_G.usr_module_require = function(module_name)
    return usr_require("modules." .. module_name)
end

_G.try_usr_module_require = function (module_name)
    local module_ok, module = try_usr_require("modules." .. module_name)
    return module_ok, module
end

M.try_bootstrap_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        PACKER_BOOTSTRAP = fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        }
        print "Installing packer close and reopen Neovim..."
        vim.cmd [[packadd packer.nvim]]
    end
end

M.check_is_plugin_loaded = function (plugin_name)
    local result = packer_plugins and packer_plugins[plugin_name] and packer_plugins[plugin_name].is_loaded
    return result
end

return M
