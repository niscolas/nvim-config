require("usr.core.commands.prose")

new_user_command("NoFile", function(opts)
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false
end, { nargs = 0 })
