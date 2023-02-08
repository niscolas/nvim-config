require("usr.core.commands.prose")

vim.api.nvim_create_user_command("NoFile", function(opts)
    vim.bo.nofile = true
    vim.bo.bufhidden = "hide"
    vim.bo.noswapfile = true
end, { nargs = 0 })
