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

        -- start treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            as = "treesitter",
            run = ":TSUpdate",
        },

        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            requires = { "treesitter", }
        },

        {
            "nvim-treesitter/playground"
        },
        -- end treesitter

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
            requires = { "nvim-lua/plenary.nvim" },
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
            requires = { "luasnip", },
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
        },

        {
            "saadparwaiz1/cmp_luasnip",
            requires = { "luasnip", },
        },

        {
            "rcarriga/nvim-dap-ui",
            requires = {
                "dap"
            },
        },

        {
            "theHamsta/nvim-dap-virtual-text",
            config = function()
                require("nvim-dap-virtual-text").setup {
                    virt_text_win_col = nil
                }
            end,
            requires = {
                "dap"
            },
        },

        {
            "lewis6991/gitsigns.nvim",
            as = "gitsigns",
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

        "tpope/vim-eunuch",

        "tpope/vim-repeat",

        {
            "kylechui/nvim-surround",
            config = function()
                require("nvim-surround").setup()
            end
        },

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
            "ggandor/leap.nvim",
            as = "leap",
        },

        {
            "nvim-neorg/neorg",
            cond = usr_module_require("plugins").check_is_not_firenvim_env,
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
        },

        {
            "rebelot/kanagawa.nvim",
            config = function()
                require("kanagawa").setup {
                    transparent = true,
                }
            end,
            disable = true,
        },

        {
            "RRethy/vim-illuminate",
            config = function()
                require("illuminate").configure()
            end,
        },

        {
            "folke/noice.nvim",
            as = "noice",
            cond = { require("usr.modules.plugins").check_is_not_firenvim_env },
        },

        {
            "MunifTanjim/nui.nvim",
        },

        {
            "luisiacc/gruvbox-baby",
            disable = true,
        },

        {
            "eddyekofo94/gruvbox-flat.nvim",
        },

        {
            "windwp/nvim-spectre",
            as = "spectre",
        },

        {
            "folke/trouble.nvim",
            as = "trouble",
            config = function()
                require("trouble").setup()
            end
        },

        {
            "SmiteshP/nvim-navic",
            as = "navic",
        },

        {
            "jbyuki/one-small-step-for-vimkind"
        },

        {
            "stevearc/oil.nvim",
            as = "oil",
        },

        {
            "zbirenbaum/neodim",
            event = "LspAttach",
            disable = true,
            config = function()
                require("neodim").setup {
                    alpha = 0.75,
                    blend_color = "#000000",
                    update_in_insert = {
                        enable = true,
                        delay = 100,
                    },
                    hide = {
                        virtual_text = true,
                        signs = true,
                        underline = true,
                    },
                }
            end,
        },

        {
            "edluffy/specs.nvim",
            as = "specs",
        },

        {
            "lucasdf/hologram.nvim",
            config = function()
                require("hologram").setup {
                    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
                }
            end
        },

        {
            "jose-elias-alvarez/null-ls.nvim",
            as = "null-ls",
        },

        {
            "goolord/alpha-nvim",
            as = "alpha"
        }
    }
end

return M
