local M = {}

M.setup = function()
    local dap_ok, _ = pcall(require, "dap")

    if not dap_ok then
        return
    end

    require "keymap.dap"
end

M.data = {
    install_path = vim.fn.stdpath("data") .. "/debug_adapters/",
}

return M
