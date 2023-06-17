local M = {}

M.setup = function()
    local neorg = require("neorg")

    local load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {
            config = {
                hook = function(keybinds)
                    require("usr.neorg.keymap").setup(keybinds)
                end,
            },
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    main = "$HOME/neorg/main",
                    work = "$HOME/neorg/work",
                },
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.concealer"] = {
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
                },
            },
        },
        ["core.esupports.metagen"] = {
            config = {
                type = "auto",
            },
        },
        ["core.journal"] = {
            config = {
                strategy = "%d-%m-%Y",
            },
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            },
        },
        ["core.integrations.nvim-cmp"] = {},
    }

    local telescope_neorg_ok, _ = pcall(require, "neorg-telescope")
    if telescope_neorg_ok then
        load["core.integrations.telescope"] = {}
    end

    neorg.setup {
        load = load,
    }
end

return M
