local M = {}

M.check_is_setup_personal = function()
    local setup = niscolas.settings.setup

    if setup == nil then
        return false
    end

    local result = setup == "personal"
    return result
end

M.check_is_firenvim_env = function()
    local result = vim.g.started_by_firenvim ~= nil
    return result
end

M.check_is_not_firenvim_env = function()
    local result = vim.g.started_by_firenvim == nil
    return result
end

M.get = function()
    return {
        -- Packer can manage itself
        "wbthomason/packer.nvim",

        {
            "folke/neodev.nvim",
            config = function()
                require("neodev").setup()
            end
        },

        {
            "williamboman/mason.nvim",
            as = "mason",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
        },

        "williamboman/mason-lspconfig.nvim",

        {
            "neovim/nvim-lspconfig",
            after = {
                "neodev.nvim",
                "mason-lspconfig.nvim",
            },
            as = "lsp",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
        },

        {
            "L3MON4D3/LuaSnip",
            as = "luasnip",
        },

        {
            "nvim-treesitter/nvim-treesitter",
            as = "treesitter",
            run = ":TSUpdate",
        },

        {
            "mfussenegger/nvim-dap",
            as = "dap",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
        },

        {
            "nvim-lua/plenary.nvim",
        },

        -- TELESCOPE
        {
            "nvim-telescope/telescope.nvim",
            as = "telescope",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
            requires = {
                "nvim-lua/plenary.nvim"
            },
        },

        {
            "nvim-telescope/telescope-file-browser.nvim",
        },

        {
            "nvim-neorg/neorg-telescope",
        },

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
        },

        {
            "nvim-telescope/telescope-project.nvim",
        },

        {
            "nvim-telescope/telescope-ui-select.nvim",
        },

        "rafamadriz/friendly-snippets",

        "itchyny/calendar.vim",

        "hrsh7th/cmp-buffer",

        "hrsh7th/cmp-cmdline",

        "hrsh7th/cmp-nvim-lsp",

        "hrsh7th/cmp-path",

        "hrsh7th/cmp-emoji",

        {
            "hrsh7th/nvim-cmp",
            as = "cmp",
            requires = {
                "luasnip",
            },
        },

        {
            "saadparwaiz1/cmp_luasnip",
            requires = {
                "luasnip",
            },
        },

        "rcarriga/nvim-dap-ui",

        {
            "theHamsta/nvim-dap-virtual-text",
            config = function()
                require("nvim-dap-virtual-text").setup {
                    virt_text_win_col = nil
                }
            end,
        },

        {
            "lewis6991/gitsigns.nvim",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
        },

        {
            "tpope/vim-fugitive",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
            as = "fugitive",
        },

        "Hoffs/omnisharp-extended-lsp.nvim",

        "andymass/vim-matchup",

        {
            "b3nj5m1n/kommentary",
            config = function()
                require("kommentary.config").use_extended_mappings()
            end,
        },

        {
            "glacambre/firenvim",
            run = function()
                vim.fn["firenvim#install"](0)
            end,
        },

        {
            "karb94/neoscroll.nvim",
            config = function()
                require("neoscroll").setup {
                    easing_function = "sine",
                    mappings = { '<C-u>', '<C-d>', 'zt', 'zz', 'zb' },
                    time = 25,
                }
            end,
        },

        {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup {
                    char = "▎",
                    space_char_blankline = " ",
                    show_current_context = true,
                    show_current_context_start = true,
                }
            end,
        },

        {
            "luukvbaal/stabilize.nvim",
            config = function()
                require("stabilize").setup()
            end,
        },

        {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup()
            end,
        },

        {
            "stevearc/aerial.nvim",
            config = function()
                require("aerial").setup()
            end,
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
        },

        "tpope/vim-eunuch",

        "tpope/vim-repeat",

        "tpope/vim-surround",

        {
            "gbprod/substitute.nvim",
            as = "substitute",
        },

        {
            "folke/zen-mode.nvim",
            config = function()
                require("zen-mode").setup {}
            end
        },


        {
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
            ft = { "markdown" },
        },

        "mbbill/undotree",

        {
            "kyazdani42/nvim-web-devicons",
        },

        "lewis6991/impatient.nvim",

        "kazhala/close-buffers.nvim",

        {
            "moll/vim-bbye",
            as = "bbye",
        },

        {
            "rcarriga/nvim-notify",
            as = "notify",
        },

        {
            "wakatime/vim-wakatime",
            cond = { require("usr.modules.plugins").check_is_setup_personal },
        },

        {
            "ggandor/lightspeed.nvim",
        },

        {
            "nvim-neorg/neorg",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
        },


        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            requires = {
                "treesitter",
            }
        },

        {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup()
            end,
        },


        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        },


        {
            "feline-nvim/feline.nvim",
            as = "feline",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
            requires = {
                "stevearc/aerial.nvim",
            },
        },

        {
            "rebelot/kanagawa.nvim",
            config = function()
                require("kanagawa").setup {
                    transparent = true,
                }
            end
        },

        {
            "luisiacc/gruvbox-baby",
            config = function()
                print("test")
                vim.g.gruvbox_baby_telescope_theme = 1
                vim.g.gruvbox_baby_transparent_mode = 1
            end
        },

        {
            "echasnovski/mini.animate",
            config = function()
                require("mini.animate").setup {
                    scroll = {
                        enabled = false,
                    }
                }
            end
        }
    }
end

return M
