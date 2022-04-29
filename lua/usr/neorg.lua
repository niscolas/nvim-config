local M = {}

M.config = function()
    require("neorg").setup {
        load = {
            ["core.defaults"] = {},
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        gtd = "~/neorg/gtd/gtd",
                        kool_games_test = "~/neorg/kool_games_test",
                        ludact = "~/neorg/ludact",
                        personal = "~/neorg/personal",
                        versus = "~/neorg/versus",
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
