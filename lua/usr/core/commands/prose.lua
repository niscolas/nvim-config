local prose_enabled = false

local enable_prose = function()
    new_keymap("n", "j", "gj")
    new_keymap("n", "k", "gk")
    new_keymap("n", "$", "g$")
    new_keymap("n", "0", "g0")
    new_keymap("n", "^", "g^")
    new_keymap("n", "I", "g^i")
    new_keymap("n", "A", "g$a")

    set.number = false
    set.relativenumber = false
    set.wrap = true

    prose_enabled = true
end

local disable_prose = function()
    del_keymap("n", "j")
    del_keymap("n", "k")
    del_keymap("n", "$")
    del_keymap("n", "0")
    del_keymap("n", "^")
    del_keymap("n", "I")
    del_keymap("n", "A")

    set.number = true
    set.relativenumber = true
    set.wrap = false

    prose_enabled = false
end

new_user_command("ProseToggle", function(opts)
    if prose_enabled then
        disable_prose()
    else
        enable_prose()
    end
end, { nargs = 0 })
