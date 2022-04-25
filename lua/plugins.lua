local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
end

return packer.startup(function()
    use "wbthomason/packer.nvim" -- Packer can manage itself

    --- editing - completion
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path"
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require "plugin_configs.cmp"
        end,
    }
    use "saadparwaiz1/cmp_luasnip"
    --- editing - dap
    use {
        "mfussenegger/nvim-dap",
        config = function()
            require "plugin_configs.dap"
        end,
    }
    use "Pocco81/DAPInstall.nvim"
    --- editing - lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    --- editing - miscellaneous
    use "andymass/vim-matchup"
    use {
        "b3nj5m1n/kommentary",
        config = function()
            require "kommentary.config".use_extended_mappings()
        end,
    }
    use {
        "karb94/neoscroll.nvim",
        config = function()
            require "neoscroll".setup()
        end,
        disable = true
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "indent_blankline".setup()
        end,
    }
    use {
        "luukvbaal/stabilize.nvim",
        config = function()
            require "stabilize".setup()
        end,
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require "nvim-autopairs".setup {}
        end,
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require "plugin_configs.null-ls"
        end,
        disable = true,
    }
    use {
        "simrat39/symbols-outline.nvim",
        config = function()
            require "plugin_configs.symbols-outline"
        end,
    }
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use {
        "gbprod/substitute.nvim",
        config = function() require "plugin_configs.substitute" end,
    }
    --- editing - snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    use "theHamsta/nvim-dap-virtual-text"
    --- editing - treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function() require "plugin_configs.treesitter" end,
        run = ":TSUpdate",
    }

    --- git
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require "gitsigns".setup()
        end
    }

    --- miscellaneous
    use {
        "iamcco/markdown-preview.nvim",
        run = "!cd app && yarn install",
    }
    use {
        "mbbill/undotree",
        config = function()
            require "plugin_configs.undotree"
        end
    }
    use {
        "henriquehbr/nvim-startup.lua",
        config = function()
            require "nvim-startup".setup()
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
            require "plugin_configs.neorg".config()
        end,
    }
    use "moll/vim-bbye"
    use "wakatime/vim-wakatime"
    use "winston0410/cmd-parser.nvim"

    --- navigation
    use "ggandor/lightspeed.nvim"

    --- telescope
    use {
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        config = function()
            require "plugin_configs.telescope".config()
        end,
        keys = {
            "", "<c-p>",
            "", "<c-f>",
            "n", "<leader>t",
        },
        requires = {
            "nvim-lua/plenary.nvim"
        },
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }
    use "nvim-telescope/telescope-project.nvim"

    --- text objects
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        requires = {
            "nvim-treesitter/nvim-treesitter",
        }
    }

    --- ui
    use {
        "akinsho/bufferline.nvim",
        config = function()
            require "plugin_configs.bufferline"
        end,
    }
    use "ellisonleao/gruvbox.nvim"
    use {
        "folke/which-key.nvim",
        config = function()
            require "which-key".setup()
        end,
    }
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require "colorizer".setup()
        end,
    }
    use {
        "winston0410/range-highlight.nvim",
        config = function()
            require "range-highlight".setup()
        end,
    }
    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            require "plugin_configs.lualine"
        end,
        require = { "kyazdani42/nvim-web-devicons", },
    }
end)
