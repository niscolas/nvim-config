local usr_lsp_core = usr_module_require("lsp.core")
local util = require("lspconfig.util")

local request_files_changed = function(bufnr)
    local omnisharp_extended = require("omnisharp_extended")
    local client = omnisharp_extended.get_omnisharp_client()

    if not client then
        vim.notify("no omnisharp clients")
        return
    end

    local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
    -- file:///Users/nicolas.catarina/_vault/projects/pottermatch-secondary/client/Assets/Scripts/UI/Events/PuzzlePass/PuzzlePassPurchaseDialogViewModel.cs
    params = {
        fileName = "Assets/Scripts/UI/Events/PuzzlePass/PuzzlePassPurchaseDialogViewModel.cs",
        changeType = "Change",
    }

    local result, err = client.request_sync("textDocument/didOpen", params, 1000, bufnr)
    if err then
        print("error in filessChanged")
    else
        vim.pretty_print(result)
    end
end

local custom_on_attach = function(bufnr)
    vim.keymap.set("n", "gd", require("omnisharp_extended").telescope_lsp_definitions)
    vim.keymap.set("n", "<Leader>fc", function() request_files_changed(bufnr) end)
end

local on_attach = function(client, bufnr)
    local usr_handlers = usr_module_require("lsp.handlers")

    usr_handlers.on_attach(client, bufnr)
    custom_on_attach(bufnr)
end

local omnisharp_path = usr_lsp_core.lsp_servers_path .. "/omnisharp/Omnisharp.dll"

return {
    cmd = { "dotnet", omnisharp_path },
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    on_attach = on_attach,
    root_dir = util.root_pattern("*.sln"),
}
