local omnisharp_bin = vim.fn.expand(
    "$HOME/.local/share/nvim/lsp_servers/omnisharp-linux-x64/run")

local pid = vim.fn.getpid()

local custom_on_attach = function()
    vim.keymap.set(
        "n", "gd",
        function()
            require("omnisharp_extended").telescope_lsp_definitions()
        end)
end

local get_on_attach = function()
    local usr_handlers_ok, usr_handlers = pcall(require, "usr.modules.lsp.handlers")
    local on_attach

    if usr_handlers_ok then
        on_attach = function(client, bufnr)
            usr_handlers.on_attach(client, bufnr)
            custom_on_attach()
        end
    else
        on_attach = function()
            custom_on_attach()
        end
    end

    return on_attach
end

return {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    on_attach = get_on_attach(),
}
