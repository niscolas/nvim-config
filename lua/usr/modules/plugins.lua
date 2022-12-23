return {
    -- Packer can manage itself
    "wbthomason/packer.nvim",

    {
        "williamboman/mason.nvim",
        as = "mason"
    },

    "williamboman/mason-lspconfig.nvim",

    {
        "neovim/nvim-lspconfig",
        after = {
            "mason-lspconfig.nvim",
        },
        as = "lsp",
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
    },

    {
        "nvim-lua/plenary.nvim",
    },

    {
        "nvim-telescope/telescope.nvim",
        as = "telescope",
        requires = {
            "nvim-lua/plenary.nvim"
        },
    },

    "nvim-telescope/telescope-file-browser.nvim",

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

    {
        "rcarriga/nvim-dap-ui",
        requires = {
            "dap",
        },
    },

    "theHamsta/nvim-dap-virtual-text",

    "lewis6991/gitsigns.nvim",

    {
        "tpope/vim-fugitive",
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
        disable = false,
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
        disable = false,
    },

    {
        "ggandor/lightspeed.nvim",
        disable = false,
    },

    "nvim-neorg/neorg",

    "nvim-neorg/neorg-telescope",

    "rafamadriz/friendly-snippets",

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        disable = false,
        requires = {
            "telescope"
        },
        run = "make",
    },

    {
        "nvim-telescope/telescope-project.nvim",
        disable = false,
        requires = {
            "telescope"
        }
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        disable = false,
        requires = {
            "telescope"
        }
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        disable = false,
        requires = {
            "treesitter",
        }
    },

    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end,
        disable = false,
    },


    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
        disable = false,
    },


    {
        "feline-nvim/feline.nvim",
        as = "feline",
        requires = {
            "stevearc/aerial.nvim",
        },
    },

    {
        "eddyekofo94/gruvbox-flat.nvim",
        config = function()
            vim.cmd("colorscheme gruvbox-flat")
        end
    },

    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                undercurl = true,
                underline = true,
                bold = true,
                italic = true,
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "soft", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
            vim.cmd("colorscheme gruvbox")
        end,
        disable = true,
    },
}
