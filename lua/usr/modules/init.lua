local M = {}

M.setup = function()
    local impatient_ok, impatient = pcall(require, "impatient")
    if impatient_ok then
        impatient.enable_profile()
    end

    require("usr.modules.packer")
end

return M
