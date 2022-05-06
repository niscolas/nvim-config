local M = {}

M.setup = function() end

M.config = function()
    require("neorg").setup {
        load = {
            ["core.defaults"] = {},
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        kool_games_test = "~/neorg/kool_games_test",
                        ludact = "~/neorg/ludact",
                        personal = "/home/niscolas/_ssd_vault/neorg/personal",
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
            ["core.norg.esupports.metagen"] = {
                config = {
                    type = "auto",
                },
            },
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
                    workspace = "personal",
                },
            },
            ["core.integrations.nvim-cmp"] = {},
            ["core.integrations.telescope"] = {}
        }
    }

    require("usr.neorg.keymap").setup()
end

return M
