local M = {}

M.setup = function()
    local feline_setup = require("usr.themes").get_field("feline_setup")
    feline_setup()
end

return M
