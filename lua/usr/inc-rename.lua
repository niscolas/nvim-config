local M = {}

M.setup_keymap = function(client, bufnr)
    new_keymap("n", "<Leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true, silent = true, buffer = bufnr })
end

M.setup = function()
    require("usr.lsp.handlers").add_post_on_attach_callback(setup_keymap)
end

return M
