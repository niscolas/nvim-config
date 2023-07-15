local M = {}

M.setup = function()
    require("auto-save").setup {
        enabled = false,
        condition = function(buf)
            local utils = require("auto-save.utils.data")

            if
                fn.getbufvar(buf, "&modifiable") == 1
                and utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil" })
            then
                return true
            end
            return false
        end,
    }
end

return M
