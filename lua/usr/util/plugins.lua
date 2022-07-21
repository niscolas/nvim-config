local M = {}

_G.module_prefix = "usr.modules."

_G.reqmod = function(module_name)
    return require(module_prefix .. module_name)
end

_G.try_reqmod = function (module_name)
    local module_ok, module = pcall(require, module_prefix .. module_name)
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

return M
