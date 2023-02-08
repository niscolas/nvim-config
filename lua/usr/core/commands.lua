require("usr.core.commands.prose")

vim.api.nvim_create_user_command("NoFile", function(opts)
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.noswapfile = true
end, { nargs = 0 })
