local M = {}

M.setup = function() end

M.config = function()
    require("neorg").setup {
        load = {
            ["core.defaults"] = {},
            ["core.keybinds"] = {
                config = {
                    hook = function (keybinds)
                        require("usr.neorg.keymap").setup(keybinds)
                    end
                },
            },
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        gtd = "/home/niscolas/_ssd_vault/neorg/gtd",
                        guilhermevie = "/home/niscolas/_ssd_vault/neorg/guilhermevie",
                        kool_games_test = "/home/niscolas/_ssd_vault/neorg/kool_games_test",
                        ludact = "/home/niscolas/_ssd_vault/neorg/ludact",
                        personal = "/home/niscolas/_ssd_vault/neorg/personal",
                        versus = "/home/niscolas/_ssd_vault/neorg/versus",
                    }
                }
            },
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp",
                }
            },
            ["core.norg.concealer"] = {
                config = {
                    icons = {
                        heading = {
                            enabled = true,

                            level_1 = {
                                icon = "",
                            },

                            level_2 = {
                                icon = " ",
                            },

                            level_3 = {
                                icon = "  ",
                            },

                            level_4 = {
                                icon = "   ",
                            },

                            level_5 = {
                                icon = "    ",
                            },

                            level_6 = {
                                icon = "     ",
                            },
                        },
                    }
                },
            },
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
                    workspace = "gtd",
                },
            },
            ["core.integrations.nvim-cmp"] = {},
            ["core.integrations.telescope"] = {}
        }
    }
end

return M
