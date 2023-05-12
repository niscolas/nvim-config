local M = {}

local function setup_highlight(client)
    if not client.supports_method("textDocument/documentHighlight") then
        return
    end

    api.nvim_exec(
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
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local result = cmp_nvim_lsp.default_capabilities()
    result = join_tables_forced(result or {}, {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    })
    result.offsetEncoding = { "utf-16" }

    return result
end

M._capabilities = nil

M._post_on_attach_functions = {}

M._on_attach = function(client, bufnr)
    require("usr.modules.lsp.keymap")._setup { bufnr = bufnr }

    setup_highlight(client)

    require("usr.core.util").call_multi_function(
        M._post_on_attach_functions,
        function() end,
        client,
        bufnr
    )
end

M.setup = function()
    M._capabilities = get_capabilities()
end

return M
