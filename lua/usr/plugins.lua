local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Packer can manage itself

    --- editing - completion
    use "hrsh7th/cmp-buffer"

    use "hrsh7th/cmp-cmdline"

    use "hrsh7th/cmp-nvim-lsp"

    use "hrsh7th/cmp-path"

    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("usr.cmp")
        end,
    }

    use "saadparwaiz1/cmp_luasnip"

    --- editing - dap
    use "folke/lua-dev.nvim"

    use {
        "mfussenegger/nvim-dap",
        config = function()
            require("usr.dap")
        end,
    }

    --- editing - lsp
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("usr.lsp")
        end
    }

    use "williamboman/nvim-lsp-installer"

    --- editing - miscellaneous
    use "andymass/vim-matchup"

    use {
        "b3nj5m1n/kommentary",
        config = function()
            require("kommentary.config").use_extended_mappings()
        end,
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("usr.lsp.null-ls")
        end,
        disable = true,
    }

    use {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup {
                easing_function = "circular",
                mappings = { '<C-u>', '<C-d>', '<C-b>', 'zt', 'zz', 'zb' },
            }
        end,
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup()
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
        config = function()
            require("nvim-autopairs").setup {}
        end,
    }

    use {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("usr.symbols_outline")
        end,
    }

    use "tpope/vim-repeat"

    use "tpope/vim-surround"

    use {
        "gbprod/substitute.nvim",
        config = function()
            require("usr.substitute")
        end,
    }

    --- editing - snippets
    use "L3MON4D3/LuaSnip"

    use "rafamadriz/friendly-snippets"

    use "theHamsta/nvim-dap-virtual-text"

    --- editing - treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("usr.treesitter")
        end,
        run = ":TSUpdate",
    }

    --- git
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("usr.gitsigns").config()
        end
    }
    use {
        "TimUntersberger/neogit",
        config = function()
            require("usr.neogit")
        end,
        requires = "nvim-lua/plenary.nvim"
    }

    --- miscellaneous
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("usr.toggleterm").config()
        end,
    }

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end
    }

    use {
        "iamcco/markdown-preview.nvim",
        run = "!cd app && yarn install",
    }

    use {
        "mbbill/undotree",
        config = function()
            require("usr.undotree")
        end
    }

    use {
        "henriquehbr/nvim-startup.lua",
        config = function()
            require("nvim-startup").setup()
        end,
        event = "VimEnter",
    }

    -- use "nathom/filetype.nvim"
    use {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons"
    }

    use "lewis6991/impatient.nvim"

    use {
        "nvim-lua/plenary.nvim",
        module = "plenary"
    }

    use {
        "nvim-neorg/neorg",
        config = function()
            require("usr.neorg").config()
        end,
    }

    use {
        "moll/vim-bbye",
        config = function()
            require("usr.bbye").config()
        end
    }

    use {
        "rcarriga/nvim-notify",
        config = function()
            require("usr.notify")
        end
    }

    use "Tastyep/structlog.nvim"

    use "wakatime/vim-wakatime"

    use "winston0410/cmd-parser.nvim"

    --- navigation
    use "ggandor/lightspeed.nvim"

    --- telescope
    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("usr.telescope").config()
        end,
        requires = {
            "nvim-lua/plenary.nvim"
        },
    }

    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }

    use "nvim-telescope/telescope-project.nvim"

    use "nvim-telescope/telescope-ui-select.nvim"

    --- text objects
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = {
            "nvim-treesitter/nvim-treesitter",
        }
    }

    --- ui
    -- use "gruvbox-community/gruvbox"

    use "sainnhe/gruvbox-material"

    -- use "ellisonleao/gruvbox.nvim"

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
        "winston0410/range-highlight.nvim",
        config = function()
            require("range-highlight").setup()
        end,
    }

    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("usr.lualine")
        end,
        require = { "kyazdani42/nvim-web-devicons", },
    }
end)
