local M = {}

M.lsp_servers_path = fn.stdpath("data") .. "/mason/packages"

M.servers = {
    ["clangd"] = {
        ensure_installed = true,
        has_custom_config = false,
    },
    ["gdscript"] = {
        ensure_installed = false,
        has_custom_config = false,
    },
    ["jsonls"] = {
        ensure_installed = true,
        has_custom_config = false,
    },
    ["csharp_ls"] = {
        ensure_installed = true,
        has_custom_config = false,
    },
    -- ["omnisharp"] = {
    --     ensure_installed = true,
    --     has_custom_config = true,
    -- },
    ["rust_analyzer"] = {
        ensure_installed = true,
        has_custom_config = false,
    },

    ["lua_ls"] = {
        ensure_installed = true,
        has_custom_config = true,
    },
    ["vimls"] = {
        ensure_installed = true,
        has_custom_config = false,
    },
    ["bashls"] = {
        ensure_installed = true,
        has_custom_config = false,
    },
    -- nil_ls = {
    --     ensure_installed = true,
    --     has_custom_config = false,
    -- },
    ["yamlls"] = {
        ensure_installed = true,
        has_custom_config = false,
    },
}

M.ensure_installed_servers = {}

return M
