local M = {}

M.setup = function() end

M.config = function()
    local neorg_ok, neorg = pcall(require, "neorg")

    if not neorg_ok then
        return
    end

    neorg.setup {
        load = {
            ["core.defaults"] = {},
            ["core.keybinds"] = {
                config = {
                    hook = function(keybinds)
                        require("usr.modules.neorg.keymap").setup(keybinds)
                    end
                },
            },
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        main = "$HOME/neorg/main",
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
                    custom_tag_completion = true,
                    exclude = {
                        "index.norg",
                        "journal",
                        "pages"
                    },
                    workspace = "main",
                },
            },
            ["core.integrations.nvim-cmp"] = {},
            ["core.integrations.telescope"] = {}
        }
    }
end

return M
