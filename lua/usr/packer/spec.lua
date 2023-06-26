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
        disable = true,
    }

    use {
        "williamboman/mason.nvim",
        as = "mason",
        cond = require("usr.firenvim").is_not_env,
        config = require("usr.packer.util").custom_config,
        requires = {
            "williamboman/mason-lspconfig.nvim",
        },
    }

    use {
        "neovim/nvim-lspconfig",
        after = {
            "neodev",
            "mason-lspconfig.nvim",
        },
        as = "lsp",
        cond = require("usr.firenvim").is_not_env,
        config = require("usr.packer.util").custom_config,
        requires = {
            "Hoffs/omnisharp-extended-lsp.nvim",
        },
    }

    use {
        "L3MON4D3/LuaSnip",
        as = "luasnip",
        config = require("usr.packer.util").custom_config,
        requires = {
            "rafamadriz/friendly-snippets",
        },
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        as = "treesitter",
        config = require("usr.packer.util").custom_config,
        requires = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/playground",
        },
        run = ":TSUpdate",
    }

    use {
        "mfussenegger/nvim-dap",
        as = "dap",
        cond = require("usr.firenvim").is_not_env,
        config = require("usr.packer.util").custom_config,
        requires = {
            "rcarriga/nvim-dap-ui",
            "nvim-dap-virtual-text",
        },
    }

    use {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup {
                virt_text_win_col = nil,
            }
        end,
    }

    use { "nvim-lua/plenary.nvim" }

    use {
        "hrsh7th/nvim-cmp",
        as = "cmp",
        config = require("usr.packer.util").custom_config,
        cond = require("usr.firenvim").is_not_env,
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-emoji",
        },
    }

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        as = "gitsigns",
        cond = require("usr.firenvim").is_not_env,
        config = require("usr.packer.util").custom_config,
    }

    use {
        "tpope/vim-fugitive",
        as = "fugitive",
        cond = require("usr.firenvim").is_not_env,
        config = require("usr.packer.util").custom_config,
    }

    use { "tpope/vim-rhubarb" }

    use { "andymass/vim-matchup" }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    }

    use {
        "glacambre/firenvim",
        config = require("usr.packer.util").custom_config,
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
        config = require("usr.packer.util").custom_config,
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
        config = require("usr.packer.util").custom_config,
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
            g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    }

    use {
        "mbbill/undotree",
        config = require("usr.packer.util").custom_config,
    }

    use {
        "kyazdani42/nvim-web-devicons",
    }

    use("lewis6991/impatient.nvim")

    use("kazhala/close-buffers.nvim")

    use {
        "moll/vim-bbye",
        as = "bbye",
        config = require("usr.packer.util").custom_config,
    }

    use {
        "rcarriga/nvim-notify",
        as = "notify",
        config = require("usr.packer.util").custom_config,
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
        config = require("usr.packer.util").custom_config,
    }

    use {
        "nvim-neorg/neorg",
        after = { "cmp", "lsp" },
        cond = require("usr.firenvim").is_not_env,
        config = require("usr.packer.util").custom_config,
        run = ":Neorg sync-parsers",
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
        after = { "navic", "noice" },
        as = "feline",
        cond = require("usr.firenvim").is_not_env,
        config = require("usr.packer.util").custom_config,
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
            require("usr.firenvim").is_not_env,
        },
        config = require("usr.packer.util").custom_config,
    }

    use {
        "MunifTanjim/nui.nvim",
    }

    use { "eddyekofo94/gruvbox-flat.nvim", disable = true }

    use {
        "windwp/nvim-spectre",
        as = "spectre",
    }

    use {
        "folke/trouble.nvim",
        as = "trouble",
    }

    use {
        "SmiteshP/nvim-navic",
        as = "navic",
        config = require("usr.packer.util").custom_config,
    }

    use { "jbyuki/one-small-step-for-vimkind" }

    use {
        "stevearc/oil.nvim",
        as = "oil",
        config = require("usr.packer.util").custom_config,
    }

    use {
        "zbirenbaum/neodim",
        after = "noice",
        event = "LspAttach",
        config = function()
            require("neodim").setup {
                alpha = 0.5,
                blend_color = "#000000",
                update_in_insert = {
                    enable = true,
                    delay = 100,
                },
                hide = {
                    virtual_text = false,
                    signs = false,
                    underline = false,
                },
            }
        end,
    }

    use {
        "edluffy/specs.nvim",
        as = "specs",
        config = require("usr.packer.util").custom_config,
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
        config = require("usr.packer.util").custom_config,
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
        after = "gruvbox.nvim",
        config = require("usr.packer.util").custom_config,
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
                -- context = 10,
                -- dimming = {
                --     alpha = 0.5, -- amount of dimming
                --     -- we try to get the foreground from the highlight groups or fallback color
                --     color = { "Normal", "#ffffff" },
                --     term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                --     inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
                -- },
                exclude = { "help" },
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

    use { "ellisonleao/gruvbox.nvim" }

    use {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup()
        end,
    }

    use {
        "m4xshen/smartcolumn.nvim",
        config = function()
            require("smartcolumn").setup()
        end,
    }

    use {
        "akinsho/git-conflict.nvim",
        config = function()
            require("git-conflict").setup()
        end,
    }

    use {
        "IndianBoy42/tree-sitter-just",
        config = function()
            require("tree-sitter-just").setup {}
        end,
    }

    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup {
                suggestion = { enabled = false },
                panel = { enabled = false },
            }
        end,
    }

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    }

    use {
        "akinsho/toggleterm.nvim",
        as = "toggleterm",
        tag = "*",
        config = require("usr.packer.util").custom_config,
    }

    use {
        "nvim-neotest/neotest",
        as = "neotest",
        config = function()
            require("neotest").setup {
                adapters = {
                    require("neotest-dotnet") {
                        discovery_root = "solution",
                    },
                },
                library = { plugins = { "neotest" }, types = true },
                loglevel = 1,
            }
        end,
        requires = {
            "antoinemadec/FixCursorHold.nvim",
            "Issafalcon/neotest-dotnet",
        },
    }

    -- use {
    --     "anuvyklack/windows.nvim",
    --     requires = {
    --         "anuvyklack/middleclass",
    --         "anuvyklack/animation.nvim",
    --     },
    --     config = function()
    --         vim.o.winwidth = 10
    --         vim.o.winminwidth = 10
    --         vim.o.equalalways = false
    --         require("windows").setup { animation = { fps = 60, duration = 100 } }
    --     end,
    -- }

    use {
        "lvimuser/lsp-inlayhints.nvim",
        config = function()
            require("lsp-inlayhints").setup()

            vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
            vim.api.nvim_create_autocmd("LspAttach", {
                group = "LspAttach_inlayhints",
                callback = function(args)
                    if not (args.data and args.data.client_id) then
                        return
                    end

                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    require("lsp-inlayhints").on_attach(client, bufnr)
                end,
            })
        end,
    }

    use {
        "VidocqH/lsp-lens.nvim",
        config = function()
            require("lsp-lens").setup {}
        end,
    }
end)
