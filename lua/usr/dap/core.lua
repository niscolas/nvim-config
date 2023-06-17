local M = {}

local function setup_listeners(dap)
    dap.listeners.before["event_initialized"]["my-nvim"] = function(_, _)
        vim.notify("DAP Initialized")
    end

    dap.listeners.before["event_terminated"]["my-nvim"] = function(_, _)
        vim.notify("DAP Terminated")
    end
end

local get_intall_path = function()
    local usr_lsp_core = require("usr.lsp.core")
    local result = usr_lsp_core.lsp_servers_path
    return result
end

M.debuggers = {
    godot = {},
    lua = {},
    unity = {},
}

M.install_path = get_intall_path()

M.setup = function()
    local dap = require("dap")
    setup_listeners(dap)
end

M.setup_debuggers = function()
    for name, config in pairs(M.debuggers) do
        require("usr.dap.debuggers." .. name)
    end
end

return M
