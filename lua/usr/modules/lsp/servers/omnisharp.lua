local usr_lsp = reqmod("lsp")

-- local omnisharp_bin = usr_lsp.lsp_installer_path .. "/omnisharp/omnisharp/OmniSharp.dll"
local omnisharp_bin = usr_lsp.lsp_installer_path .. "/omnisharp-old/run"

local pid = vim.fn.getpid()

local custom_on_attach = function()
    print("omnisharp custom on attach")
    vim.keymap.set(
        "n", "gd",
        function()
            print("using omnisharp extended")
            require("omnisharp_extended").telescope_lsp_definitions()
        end)
end

local on_attach = function()
    print("omnisharp on attach")
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
    -- cmd = { "dotnet", omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    on_attach = on_attach,
}
