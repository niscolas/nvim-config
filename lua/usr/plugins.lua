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
    --
    --- colors
    use {
        "gruvbox-community/gruvbox",
        disable = true,
    }

    use {
        "lifepillar/vim-gruvbox8",
        disable = false,
    }

    use {
        "sainnhe/gruvbox-material",
        disable = false,
    }

    use {
        "ellisonleao/gruvbox.nvim",
        disable = true,
    }

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

    use {
        "saadparwaiz1/cmp_luasnip",
        disable = false,
    }

    use {
        "hrsh7th/cmp-vsnip",
        disable = true,
    }

    use {
        "hrsh7th/vim-vsnip",
        disable = true,
    }

    --- editing - dap

    use {
        "mfussenegger/nvim-dap",
        config = function()
            require("usr.dap")
        end,
    }

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
                mappings = { '<C-u>', '<C-d>', 'zt', 'zz', 'zb' },
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
    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("usr.luasnip")
        end,
        disable = false,
    }

    use "rafamadriz/friendly-snippets"

    use "theHamsta/nvim-dap-virtual-text"

    --- git
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("usr.gitsigns").config()
        end
    }

    use {
        "tpope/vim-fugitive",
        setup = function()
            require("usr.fugitive").setup()
        end
    }

    --- lsp
    use {
        "folke/lua-dev.nvim",
        config = function()
            require("lua-dev").setup()
        end
    }

    use "Hoffs/omnisharp-extended-lsp.nvim"

    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("usr.lsp")
        end
    }

    use "williamboman/nvim-lsp-installer"

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

    use {
        "nathom/filetype.nvim",
        disable = true,
    }

    use {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons"
    }

    use "lewis6991/impatient.nvim"

    use {
        "nvim-lua/plenary.nvim",
        module = "plenary"
    }

    use "kazhala/close-buffers.nvim"

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

    use "wakatime/vim-wakatime"

    --- navigation
    use "ggandor/lightspeed.nvim"

    --- neorg
    use {
        "nvim-neorg/neorg",
        config = function()
            require("usr.neorg").config()
        end,
        --[[ setup = function ()
            require("usr.neorg").setup()
        end ]]
    }

    use "nvim-neorg/neorg-telescope"

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
        requires = {
            "nvim-telescope/telescope.nvim"
        },
        run = "make",
    }

    use {
        "nvim-telescope/telescope-project.nvim",
        requires = {
            "nvim-telescope/telescope.nvim"
        }
    }

    use {
        "nvim-telescope/telescope-ui-select.nvim",
        requires = {
            "nvim-telescope/telescope.nvim"
        }
    }

    --- text objects
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = {
            "nvim-treesitter/nvim-treesitter",
        }
    }

    --- treesitter
    use {
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup()
        end,
        requires = {
            "nvim-treesitter/nvim-treesitter",
        }
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("usr.treesitter")
        end,
        run = ":TSUpdate",
    }


    --- ui
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
        "nvim-lualine/lualine.nvim",
        config = function()
            require("usr.lualine")
        end,
        require = { "kyazdani42/nvim-web-devicons", },
    }
end)
