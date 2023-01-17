local M = {}

local function setup_diagnostic_signs()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
end

local function setup_highlight(client)
    -- Set autocommands conditional on server_capabilities
    if not client.server_capabilities.document_highlight then
        return
    end

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

M.on_attach = function(client, bufnr)
    require("usr.modules.lsp.keymap").setup(bufnr)
    require("nvim-navic").attach(client, bufnr)
    setup_highlight(client)
end

M.capabilities = get_capabilities()

M.setup = function()
    setup_diagnostic_signs()

    vim.diagnostic.config({
        virtual_text = {
            prefix = "● "
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

return M

