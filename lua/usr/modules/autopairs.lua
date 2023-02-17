require("nvim-autopairs").setup()

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_ok, cmp = pcall(require, "cmp")
print("a")

if not cmp_ok then
    return
end

print("b")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
print("c")
