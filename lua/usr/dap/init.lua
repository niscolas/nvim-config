local M = {}

M.setup = function()
    require("usr.dap.core").setup()
    require("usr.dap.keymap")
    require("usr.dap.virtual_text")
    require("usr.dap.dap-ui")
    require("usr.dap.core").setup_debuggers()
end

return M
