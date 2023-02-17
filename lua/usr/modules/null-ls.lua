local null_ls = require("null-ls")

local null_ls_format = function(bufnr)
    vim.lsp.buf.format {
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    }
end

local augroup = augroup("lsp_formatting", { clear = true })

local on_attach = function(client, bufnr)
    if not client.supports_method("textDocument/formatting") then
        return
    end

    clear_autocmd { group = augroup, buffer = bufnr }
    autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            null_ls_format(bufnr)
        end,
    })
end

null_ls.setup {
    on_attach = on_attach,
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.gdformat,
    },
}

table.insert(require("usr.modules.lsp").formatters, null_ls_format)
