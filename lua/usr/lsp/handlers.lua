local M = {}

M.post_on_attach_callbacks = {}

local function setup_highlight(client)
    -- if not client.supports_method("textDocument/documentHighlight") then
    --     return
    -- end
    --
    -- api.nvim_exec(
    --     [[
    --     augroup lsp_document_highlight
    --     autocmd! * <buffer>
    --     autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --     augroup END
    --     ]],
    --     false
    -- )
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

M.setup = function()
    M._capabilities = get_capabilities()
end

M.add_post_on_attach_callback = function(callback)
    table.insert(M.post_on_attach_callbacks, callback)
end

M._on_attach = function(client, bufnr)
    require("usr.lsp.keymap")._setup { bufnr = bufnr }

    setup_highlight(client)

    for _, callback in ipairs(M.post_on_attach_callbacks) do
        callback(client, bufnr)
    end
end

return M
