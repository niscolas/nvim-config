local packer = require("packer")
packer.startup(function(use)
    use {
        "wbthomason/packer.nvim",
    }

    use {
        "folke/neodev.nvim",
        as = "neodev",
        config = function()
            require("neodev").setup()
        end,
    }

    use {
        "williamboman/mason.nvim",
        as = "mason",
        cond = require("usr.modules.firenvim").is_not_env,
        config = require("usr.modules.packer.util").custom_config,
    }

    use { "williamboman/mason-lspconfig.nvim" }

    use {
        "neovim/nvim-lspconfig",
        after = {
            "neodev",
            "mason-lspconfig.nvim",
        },
        as = "lsp",
        cond = require("usr.modules.firenvim").is_not_env,
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "L3MON4D3/LuaSnip",
        as = "luasnip",
    }

    -- start treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        as = "treesitter",
        config = require("usr.modules.packer.util").custom_config,
        run = ":TSUpdate",
    }

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = { "treesitter" },
    }

    use {
        "nvim-treesitter/playground",
    }

    -- end treesitter
    use {
        "mfussenegger/nvim-dap",
        as = "dap",
        cond = require("usr.modules.firenvim").is_not_env,
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "nvim-lua/plenary.nvim",
    }

    use("rafamadriz/friendly-snippets")

    use("hrsh7th/cmp-buffer")

    use("hrsh7th/cmp-cmdline")

    use("hrsh7th/cmp-nvim-lsp")

    use("hrsh7th/cmp-path")

    use("hrsh7th/cmp-emoji")

    use {
        "hrsh7th/nvim-cmp",
        as = "cmp",
        config = require("usr.modules.packer.util").custom_config,
        requires = { "luasnip" },
        cond = require("usr.modules.firenvim").is_not_env,
    }

    use {
        "saadparwaiz1/cmp_luasnip",
        requires = { "luasnip" },
    }

    use {
        "rcarriga/nvim-dap-ui",
        requires = { "dap" },
    }

    use {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup {
                virt_text_win_col = nil,
            }
        end,
        requires = { "dap" },
    }

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        as = "gitsigns",
        cond = require("usr.modules.firenvim").is_not_env,
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "tpope/vim-fugitive",
        as = "fugitive",
        cond = require("usr.modules.firenvim").is_not_env,
        config = require("usr.modules.packer.util").custom_config,
    }

    use { "tpope/vim-rhubarb" }

    use { "Hoffs/omnisharp-extended-lsp.nvim" }

    use { "andymass/vim-matchup" }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    }

    use {
        "glacambre/firenvim",
        config = require("usr.modules.packer.util").custom_config,
        run = function()
            fn["firenvim#install"](0)
        end,
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                char = "▎",
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }
        end,
    }

    use {
        "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup()
        end,
    }

    use {
        "windwp/nvim-autopairs",
        after = "cmp",
        as = "autopairs",
        config = require("usr.modules.packer.util").custom_config,
    }

    use("tpope/vim-eunuch")

    use("tpope/vim-repeat")

    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    }

    use {
        "gbprod/substitute.nvim",
        as = "substitute",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end,
    }

    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    }

    use {
        "mbbill/undotree",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "kyazdani42/nvim-web-devicons",
    }

    use("lewis6991/impatient.nvim")

    use("kazhala/close-buffers.nvim")

    use {
        "moll/vim-bbye",
        as = "bbye",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "rcarriga/nvim-notify",
        as = "notify",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "wakatime/vim-wakatime",
        cond = {
            require("usr.core.util").check_is_personal_setup,
        },
    }

    use {
        "ggandor/leap.nvim",
        as = "leap",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "nvim-neorg/neorg",
        cond = require("usr.modules.firenvim").is_not_env,
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end,
    }

    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    }

    use {
        "freddiehaddad/feline.nvim",
        after = "navic",
        as = "feline",
        cond = require("usr.modules.firenvim").is_not_env,
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup {
                transparent = true,
            }
        end,
        disable = true,
    }

    use {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure()
        end,
        disable = true,
    }

    use {
        "folke/noice.nvim",
        as = "noice",
        cond = {
            require("usr.modules.firenvim").is_not_env,
        },
        config = function()
            local _, noice_setup_hls =
                require("usr.themes").try_get_member("noice_setup_hls")
            require("usr.modules.noice").setup {
                setup_hls = noice_setup_hls,
            }
        end,
    }

    use {
        "MunifTanjim/nui.nvim",
    }

    use { "eddyekofo94/gruvbox-flat.nvim" }

    use {
        "windwp/nvim-spectre",
        as = "spectre",
    }

    use {
        "folke/trouble.nvim",
        as = "trouble",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "SmiteshP/nvim-navic",
        as = "navic",
        config = require("usr.modules.packer.util").custom_config,
    }

    use { "jbyuki/one-small-step-for-vimkind" }

    use {
        "stevearc/oil.nvim",
        as = "oil",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "zbirenbaum/neodim",
        event = "LspAttach",
        disable = true,
        config = function()
            require("neodim").setup {
                alpha = 0.75,
                blend_color = "#000000",
                -- update_in_insert = {
                --     enable = true,
                --     delay = 100,
                -- },
                hide = {
                    virtual_text = true,
                    signs = true,
                    underline = true,
                },
            }
        end,
    }

    use {
        "edluffy/specs.nvim",
        as = "specs",
        config = require("usr.modules.packer.util").custom_config,
        disable = true,
    }

    use {
        "lucasdf/hologram.nvim",
        config = function()
            require("hologram").setup {
                auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
            }
        end,
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        as = "null-ls",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "goolord/alpha-nvim",
        as = "alpha",
        config = require("usr.modules.packer.util").custom_config,
    }

    use {
        "tpope/vim-sleuth",
    }

    use {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    }

    use {
        "ibhagwan/fzf-lua",
        config = function()
            local _, setup_hls =
                require("usr.themes").try_get_member("fzf_lua_setup_hls")
            require("usr.modules.fzf-lua").setup { setup_hls = setup_hls }
        end,
    }

    use {
        "levouh/tint.nvim",
        config = function()
            require("tint").setup()
        end,
        disable = true,
    }

    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
    }

    use {
        "pwntester/octo.nvim",
        config = function()
            require("octo").setup {
                picker = "fzf-lua",
            }
        end,
    }
end)
