local kind_icons = {
    Class = niscolas.icons.class,
    Color = niscolas.icons.color,
    Constant = niscolas.icons.constant,
    Constructor = niscolas.icons.constructor,
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

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        -- ["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        -- ["<C-m>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        -- mode = "symbol_text",
        format = function(entry, vim_item)
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.kind =
                string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[lsp]",
                luasnip = "[snip]",
                buffer = "[buf]",
                path = "[path]",
            })[entry.source.name]

            return vim_item
        end,
    },
    sources = {
        { name = "luasnip" },
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

local setup_hl_fn_ok, setup_hl_fn =
    require("usr.themes").try_get_member("cmp_setup_hl")

if not setup_hl_fn_ok or not setup_hl_fn then
    return
end

setup_hl_fn()
