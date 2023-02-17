local M = {}

M.try_bootstrap = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data")
        .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        PACKER_BOOTSTRAP = fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        }
        print("Installing packer close and reopen Neovim...")
        vim.cmd([[packadd packer.nvim]])
    end
end

M.check_is_plugin_loaded = function(plugin_name)
    local result = packer_plugins
        and packer_plugins[plugin_name]
        and packer_plugins[plugin_name].is_loaded
    return result
end

M.custom_config = function(plugin_name)
    local custom_config_ok, custom_config =
        pcall(require, "usr.modules." .. plugin_name)

    if not custom_config_ok then
        return
    end

    if type(custom_config) == "table" and custom_config.setup then
        custom_config.setup()
    end
end

return M
