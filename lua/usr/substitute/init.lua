local M = {}

M.setup = function()
    require("substitute").setup()
    require("usr.substitute.keymap")
end

return M
