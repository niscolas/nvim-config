local prose_enabled = false

local enable_prose = function()
    vim.keymap.set("n", "j", "gj")
    vim.keymap.set("n", "k", "gk")
    vim.keymap.set("n", "$", "g$")
    vim.keymap.set("n", "0", "g0")
    vim.keymap.set("n", "^", "g^")
    vim.keymap.set("n", "I", "g^i")
    vim.keymap.set("n", "A", "g$a")

    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.wrap = true

    prose_enabled = true
end

local disable_prose = function()
    vim.keymap.del("n", "j")
    vim.keymap.del("n", "k")
    vim.keymap.del("n", "$")
    vim.keymap.del("n", "0")
    vim.keymap.del("n", "^")
    vim.keymap.del("n", "I")
    vim.keymap.del("n", "A")

    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.wrap = false

    prose_enabled = false
end

vim.api.nvim_create_user_command("ProseToggle", function(opts)
    if prose_enabled then
        disable_prose()
    else
        enable_prose()
    end
end, { nargs = 0 })
