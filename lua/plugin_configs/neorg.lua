local M = {}

M.config = function()
    require("neorg").setup {
        load = {
            ["core.defaults"] = {},
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        personal = "~/neorg/personal",
                        ludact = "~/neorg/ludact",
                        gtd = "~/neorg/gtd/gtd",
                    }
                }
            },
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp",
                }
            },
            ["core.norg.concealer"] = {},
            ["core.norg.journal"] = {
                config = {
                    strategy = "%d-%m-%Y"
                }
            },
            ["core.presenter"] = {
                config = {
                    zen_mode = "zen-mode"
                }
            },
            ["core.gtd.base"] = {
                config = {
                    workspace = "gtd",
                },
            },
            ["core.integrations.nvim-cmp"] = {}
        }
    }
end

return M
