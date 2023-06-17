local M = {}

M.setup = function()
    require("nvim-autopairs").setup()

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp_ok, cmp = pcall(require, "cmp")

    if not cmp_ok then
        return
    end

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
