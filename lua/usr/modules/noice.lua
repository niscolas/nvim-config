local M = {}

M.setup = function(opts)
    require("noice").setup {
        cmdline = {
            -- opts = {
            --     position = {
            --         row = 100,
            --         col = "50%",
            --     },
            -- },
            view = "cmdline",
        },
        popupmenu = {
            backend = "cmp",
        },
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "search_count",
                },
                opts = { skip = true },
            },
        },
        views = {
            hover = {
                border = {
                    style = "rounded",
                },
                position = { row = 2, col = 2 },
            },
        },
    }

    local setup_hl = require("usr.themes").get_field("noice_setup_hl")
    pcall(setup_hl)
end

return M
