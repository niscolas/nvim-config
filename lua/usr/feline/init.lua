local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local force_inactive = {
    filetypes = {
        "NvimTree",
        "dbui",
        "packer",
        "startify",
        "fugitive",
        "fugitiveblame"
    },
    buftypes = {
        "terminal"
    },
    bufnames = {}
}

local winbar_components = {
    active = { {}, {}, {} },
    inactive = { {}, {}, {} },
}

local components = {
    active = { {}, {}, {} },
    inactive = { {}, {}, {} },
}

local theme = {
    bg = "#282828",
    black = "#282828",
    yellow = "#d8a657",
    cyan = "#89b482",
    oceanblue = "#45707a",
    green = "#a9b665",
    orange = "#e78a4e",
    violet = "#d3869b",
    magenta = "#c14a4a",
    white = "#a89984",
    fg = "#a89984",
    skyblue = "#7daea3",
    red = "#ea6962",
}

local vi_mode_colors = {
    NORMAL = "green",
    OP = "green",
    INSERT = "red",
    CONFIRM = "red",
    VISUAL = "skyblue",
    LINES = "skyblue",
    BLOCK = "skyblue",
    REPLACE = "violet",
    ["V-REPLACE"] = "violet",
    ENTER = "cyan",
    MORE = "cyan",
    SELECT = "orange",
    COMMAND = "green",
    SHELL = "green",
    TERM = "green",
    NONE = "yellow"
}

local active_left_components_setup = function()
    components.active[1][1] = {
        provider = {
            name = "vi_mode",
        },
        icon = "",
        hl = function()
            return {
                name = vi_mode_utils.get_mode_highlight_name(),
                bg = vi_mode_utils.get_mode_color(),
                fg = "black",
                style = "bold"
            }
        end,
        left_sep = function()
            return {
                str = " ",
                hl = {
                    vi_mode_utils.get_mode_highlight_name(),
                    bg = vi_mode_utils.get_mode_color(),
                    fg = "NONE",
                }
            }
        end,
        right_sep = function()
            return {
                str = " ",
                hl = {
                    vi_mode_utils.get_mode_highlight_name(),
                    bg = "NONE",
                    fg = vi_mode_utils.get_mode_color(),
                }
            }
        end,
    }

    components.active[1][2] = {
        provider = function()
            return vim.fn.expand("%:F")
        end,
        hl = {
            fg = "white",
            bg = "bg",
            style = "bold"
        }
    }
end

local active_mid_components_setup = function()
    components.active[2][1] = {
        provider = "git_branch",
        hl = {
            fg = "yellow",
            bg = "bg",
            style = "bold"
        }
    }

    components.active[2][2] = {
        provider = "git_diff_added",
        hl = {
            fg = "green",
            bg = "bg",
            style = "bold"
        }
    }

    components.active[2][3] = {
        provider = "git_diff_changed",
        hl = {
            fg = "orange",
            bg = "bg",
            style = "bold"
        }
    }

    components.active[2][4] = {
        provider = "git_diff_removed",
        hl = {
            fg = "red",
            bg = "bg",
            style = "bold"
        },
    }
end

local active_right_components_setup = function()
    components.active[3][1] = {
        provider = {
            name = "file_type",
            opts = {
                filetype_icon = true,
            },
        },
        hl = {
            style = "bold",
        },
        right_sep = " "
    }

    components.active[3][2] = {
        provider = function() return "" .. vim.bo.fileformat:upper() .. "" end,
        hl = {
            fg = "white",
            bg = "bg",
            style = "bold"
        },
        right_sep = " "
    }

    components.active[3][3] = {
        provider = "file_encoding",
        hl = {
            fg = "white",
            bg = "bg",
            style = "bold"
        },
        right_sep = " "
    }

    components.active[3][4] = {
        provider = "position",
        hl = {
            fg = "white",
            bg = "bg",
            style = "bold"
        },
        right_sep = " "
    }
end

local active_components_setup = function()
    active_left_components_setup()
    active_mid_components_setup()
    active_right_components_setup()
end

local inactive_components_setup = function()
    components.inactive[1][1] = {
        provider = "file_type",
        hl = {
            fg = "black",
            bg = "cyan",
            style = "bold"
        },
        left_sep = {
            str = " ",
            hl = {
                fg = "NONE",
                bg = "cyan"
            }
        },
        right_sep = {
            {
                str = " ",
                hl = {
                    fg = "NONE",
                    bg = "cyan"
                }
            },
            " "
        }
    }

end

local components_setup = function()
    active_components_setup()
    inactive_components_setup()
end

--[[ -- nvimGps

winbar_components.active[1][1] = {
  provider = function() return gps.get_location() end,
  enabled = function() return gps.is_available() end,
  hl = {
    fg = "orange",
    style = "bold"
  }
}
 ]]

local active_winbar_setup = function()
    winbar_components.active[1][1] = {
        provider = "lsp_client_names",
        hl = {
            fg = "yellow",
            style = "bold"
        },
    }

    winbar_components.active[1][2] = {
        provider = "diagnostic_errors",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
        end,
        hl = {
            fg = "red",
            style = "bold"
        }
    }

    winbar_components.active[1][3] = {
        provider = "diagnostic_warnings",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
        end,
        hl = {
            fg = "yellow",
            style = "bold"
        }
    }

    winbar_components.active[1][4] = {
        provider = "diagnostic_hints",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
        end,
        hl = {
            fg = "cyan",
            style = "bold"
        }
    }

    winbar_components.active[1][5] = {
        provider = "diagnostic_info",
        enabled = function()
            return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
        end,
        hl = {
            fg = "skyblue",
            style = "bold"
        }
    }
end

local inactive_winbar_setup = function()
    winbar_components.inactive[1][1] = {
        provider = "file_type",
        hl = {
            fg = "black",
            bg = "cyan",
            style = "bold",
        },
        left_sep = {
            str = " ",
            hl = {
                fg = "NONE",
                bg = "cyan",
            }
        },
        right_sep = {
            {
                str = " ",
                hl = {
                    fg = "NONE",
                    bg = "cyan",
                }
            },
            " ",
        }
    }
end

local winbar_setup = function()
    active_winbar_setup()
    inactive_winbar_setup()
end

components_setup()
winbar_setup()

require("feline").setup({
    theme = theme,
    vi_mode_colors = vi_mode_colors,
    components = components,
    force_inactive = force_inactive,
})

require("feline").winbar.setup({
    components = winbar_components,
    force_inactive = force_inactive,
})
