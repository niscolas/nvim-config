local M = {}

M.kind_icons = {
    Class = niscolas.icons.class,
    Color = niscolas.icons.color,
    Codeium = niscolas.icons.codeium,
    Constant = niscolas.icons.constant,
    Constructor = niscolas.icons.constructor,
    Copilot = niscolas.icons.github,
    Enum = niscolas.icons.enum,
    EnumMember = niscolas.icons.enum_member,
    Event = niscolas.icons.event,
    Field = niscolas.icons.field,
    File = niscolas.icons.file,
    Folder = niscolas.icons.directory,
    Function = niscolas.icons.fn,
    Interface = niscolas.icons.interface,
    Keyword = niscolas.icons.keyword,
    Method = niscolas.icons.method,
    Module = niscolas.icons.module,
    Operator = niscolas.icons.operator,
    Property = niscolas.icons.property,
    Reference = niscolas.icons.reference,
    Snippet = niscolas.icons.snippet,
    Struct = niscolas.icons.struct,
    Text = niscolas.icons.text,
    TypeParameter = niscolas.icons.type_parameter,
    Unit = niscolas.icons.unit,
    Value = niscolas.icons.value,
    Variable = niscolas.icons.variable,
}

M.setup = function()
    local cmp = require("cmp")

    cmp.setup {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert {
            -- ["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            -- ["<C-m>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            ["<CR>"] = cmp.mapping.confirm { select = true },
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            -- mode = "symbol_text",
            format = function(entry, vim_item)
                local kind_name = vim_item.kind
                local source_name = ({
                    buffer = "buf",
                    luasnip = "snip",
                    nvim_lsp = "lsp",
                    path = "path",
                })[entry.source.name]

                vim_item.kind = string.format("%s ", M.kind_icons[kind_name])
                vim_item.menu = string.format("%s [%s]", kind_name, source_name)

                return vim_item
            end,
        },
        sources = {
            { name = "luasnip" },
            { name = "copilot" },
            { name = "codeium" },
            { name = "cmp_tabnine" },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "neorg" },
            { name = "emoji" },
            { name = "buffer" },
        },
        experimental = {
            ghost_text = false,
        },
        window = {
            completion = {
                border = "rounded",
                winhighlight = "FloatBorder:FloatBorder",
            },
            documentation = {
                border = "rounded",
                winhighlight = "FloatBorder:FloatBorder",
            },
        },
    }

    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = "buffer" },
        }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })

    local setup_hl = require("usr.themes").get_field("cmp_setup_hl")
    setup_hl()
end

return M
