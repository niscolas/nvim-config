local M = {}

local function setup_listeners(dap)
    dap.listeners.before["event_initialized"]["my-nvim"] = function(_, _)
        vim.notify("DAP Initialized")
    end

    dap.listeners.before["event_terminated"]["my-nvim"] = function(_, _)
        vim.notify("DAP Terminated")
    end
end

M.setup = function()
    local dap_ok, dap = pcall(require, "dap")

    if not dap_ok then
        return
    end

    setup_listeners(dap)
    require("usr.dap.keymap")
end

M.data = {
    install_path = vim.fn.stdpath("data") .. "/debug_adapters/",
}

return M
