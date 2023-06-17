local M = {}

M.setup = function()
    require("usr.lazy.util").bootstrap()

    require("lazy").setup {
        {
            "ellisonleao/gruvbox.nvim",
            init = function()
                require("usr.themes").before_plugin()
            end,
            lazy = false,
            priority = 1000,
            config = function()
                require("usr.themes").after_plugin()
            end,
        },

        {
            "folke/neodev.nvim",
            config = function()
                require("neodev").setup {}
            end,
            lazy = false,
            priority = 51,
        },

        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            config = require("usr.mason").setup,
            dependencies = {
                "williamboman/mason-lspconfig.nvim",
            },
        },

        {
            "neovim/nvim-lspconfig",
            config = require("usr.lsp").setup,
            dependencies = {
                "Hoffs/omnisharp-extended-lsp.nvim",
            },
        },

        {
            "L3MON4D3/LuaSnip",
            config = require("usr.luasnip").setup,
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
        },

        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = require("usr.treesitter").setup,
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects",
                "nvim-treesitter/playground",
            },
        },

        {
            "mfussenegger/nvim-dap",
            config = require("usr.dap").setup,
            dependencies = {
                "rcarriga/nvim-dap-ui",
                "theHamsta/nvim-dap-virtual-text",
            },
        },

        {
            "nvim-lua/plenary.nvim",
            lazy = true,
        },

        {
            "hrsh7th/nvim-cmp",
            config = require("usr.cmp").setup,
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-emoji",
            },
        },

        {
            "lewis6991/gitsigns.nvim",
            config = require("usr.gitsigns").setup,
        },

        {
            "tpope/vim-fugitive",
            config = require("usr.fugitive").setup,
        },

        {
            "tpope/vim-rhubarb",
        },

        {
            "andymass/vim-matchup",
        },

        {
            "numToStr/Comment.nvim",
            config = true,
        },

        {
            "glacambre/firenvim",
            config = require("usr.firenvim").setup,
            build = function()
                fn["firenvim#install"](0)
            end,
        },

        {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup {
                    char = "▎",
                    char_priority = 50,
                    context_char = "┃",
                    show_current_context = true,
                    show_current_context_start = true,
                    space_char_blankline = " ",
                }
            end,
        },

        {
            "luukvbaal/stabilize.nvim",
            config = true,
        },

        {
            "windwp/nvim-autopairs",
            config = require("usr.autopairs").setup,
        },

        {
            "tpope/vim-eunuch",
        },

        {
            "tpope/vim-repeat",
        },

        {
            "kylechui/nvim-surround",
            config = true,
        },

        {
            "gbprod/substitute.nvim",
            config = require("usr.substitute").setup,
        },

        {
            "folke/zen-mode.nvim",
            config = true,
        },

        {
            "iamcco/markdown-preview.nvim",
            build = "cd app && npm install",
            ft = { "markdown" },
            init = function()
                g.mkdp_filetypes = { "markdown" }
            end,
        },

        {
            "mbbill/undotree",
            config = require("usr.undotree").setup,
        },

        {
            "kyazdani42/nvim-web-devicons",
            lazy = true,
        },

        {
            "kazhala/close-buffers.nvim",
        },

        {
            "moll/vim-bbye",
            config = require("usr.bbye").setup,
        },

        {
            "rcarriga/nvim-notify",
            config = require("usr.notify").setup,
        },

        {
            "wakatime/vim-wakatime",
            cond = require("usr.core.util").check_is_personal_setup,
        },

        {
            "ggandor/leap.nvim",
            config = require("usr.leap").setup,
        },

        {
            "nvim-neorg/neorg",
            config = require("usr.neorg").setup,
            build = ":Neorg sync-parsers",
        },

        {
            "folke/which-key.nvim",
            config = true,
        },

        {
            "norcalli/nvim-colorizer.lua",
            config = true,
        },

        {
            "freddiehaddad/feline.nvim",
            config = require("usr.feline").setup,
        },

        {
            "RRethy/vim-illuminate",
            config = function()
                require("illuminate").configure()
            end,
        },

        {
            "folke/noice.nvim",
            config = require("usr.noice").setup,
        },

        {
            "MunifTanjim/nui.nvim",
        },

        {
            "windwp/nvim-spectre",
        },

        {
            "folke/trouble.nvim",
        },

        {
            "SmiteshP/nvim-navic",
            config = require("usr.navic").setup,
        },

        {
            "jbyuki/one-small-step-for-vimkind",
        },

        {
            "stevearc/oil.nvim",
            config = require("usr.oil").setup,
        },

        {
            "zbirenbaum/neodim",
            event = "LspAttach",
            opts = {
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
            },
        },

        {
            "edluffy/specs.nvim",
            config = require("usr.specs").setup,
            disable = true,
        },

        {
            "lucasdf/hologram.nvim",
            opts = {
                auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
            },
        },

        {
            "jose-elias-alvarez/null-ls.nvim",
            as = "null-ls",
            config = require("usr.null-ls").setup,
        },

        {
            "tpope/vim-sleuth",
        },

        {
            "smjonas/inc-rename.nvim",
            config = true,
        },

        {
            "ibhagwan/fzf-lua",
            config = require("usr.fzf-lua").setup,
            init = require("usr.fzf-lua").init,
        },

        {
            "levouh/tint.nvim",
            config = true,
            enabled = false,
        },

        {
            "folke/twilight.nvim",
            opts = {
                -- context = 10,
                -- dimming = {
                --     alpha = 0.5, -- amount of dimming
                --     -- we try to get the foreground from the highlight groups or fallback color
                --     color = { "Normal", "#ffffff" },
                --     term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                --     inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
                -- },
                exclude = { "help" },
            },
        },

        {
            "pwntester/octo.nvim",
        },

        {
            "nvim-treesitter/nvim-treesitter-context",
            config = true,
        },

        {
            "m4xshen/smartcolumn.nvim",
            config = true,
        },

        {
            "akinsho/git-conflict.nvim",
            config = true,
            version = "*",
        },

        {
            "IndianBoy42/tree-sitter-just",
            config = true,
        },

        {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            dependencies = {
                "zbirenbaum/copilot-cmp",
            },
            event = "InsertEnter",
            opts = {
                suggestion = { enabled = false },
                panel = { enabled = false },
            },
        },

        {
            "zbirenbaum/copilot-cmp",
            config = true,
        },

        {
            "akinsho/toggleterm.nvim",
            config = require("usr.toggleterm").setup,
            version = "*",
        },

        {
            "nvim-neotest/neotest",
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
            dependencies = {
                "antoinemadec/FixCursorHold.nvim",
                "Issafalcon/neotest-dotnet",
            },
        },

        {
            "anuvyklack/windows.nvim",
            config = function()
                vim.o.winwidth = 10
                vim.o.winminwidth = 10
                vim.o.equalalways = false
                require("windows").setup {
                    animation = {
                        fps = 60,
                        duration = 100,
                    },
                }
            end,
            dependencies = {
                "anuvyklack/middleclass",
                "anuvyklack/animation.nvim",
            },
            enabled = false,
        },

        {
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
                        local client =
                            vim.lsp.get_client_by_id(args.data.client_id)
                        require("lsp-inlayhints").on_attach(client, bufnr)
                    end,
                })
            end,
        },

        {
            "VidocqH/lsp-lens.nvim",
            config = true,
        },

        {
            import = "usr.neoai.spec",
        },
    }
end

return M
