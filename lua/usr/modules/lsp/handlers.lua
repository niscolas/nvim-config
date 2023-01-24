local M = {}

local function setup_highlight(client)
    -- Set autocommands conditional on server_capabilities
    -- if not client.supports_method("textDocument/highlight") then
    --     return
    -- end

    vim.api.nvim_exec(
        [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
        false
    )
end

local function get_capabilities()
    local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not cmp_nvim_lsp_ok then
        return
    end

    local result = cmp_nvim_lsp.default_capabilities()
    return result
end

M.capabilities = get_capabilities()

M.on_attach = function(client, bufnr)
    require("usr.modules.lsp.keymap").setup { bufnr = bufnr }
    require("nvim-navic").attach(client, bufnr)
    setup_highlight(client)
end

M.setup = function()
    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })
end

return M
