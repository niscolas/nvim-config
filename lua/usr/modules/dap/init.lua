local M = {}

M.config = function()
    require("usr.modules.dap.core").setup()
    require("usr.modules.dap.virtual_text")
    require("usr.modules.dap.dap-ui")
    require("usr.modules.dap.debuggers.unity")
end

return M
