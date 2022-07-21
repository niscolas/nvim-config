require("usr.util.plugins").try_bootstrap_packer()

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

    use "itchyny/calendar.vim"

    --- completion
    use "hrsh7th/cmp-buffer"

    use "hrsh7th/cmp-cmdline"

    use "hrsh7th/cmp-nvim-lsp"

    use "hrsh7th/cmp-path"

    use "hrsh7th/cmp-emoji"

    use {
        "hrsh7th/nvim-cmp",
        config = reqmod("cmp").config(),
        requires = {
            "L3MON4D3/LuaSnip",
        },
    }

    use {
        "saadparwaiz1/cmp_luasnip",
        disable = false,
        requires = {
            "L3MON4D3/LuaSnip",
        },
    }

    use {
        "hrsh7th/cmp-vsnip",
        disable = true,
        requires = {
            "hrsh7th/nvim-cmp",
        },
    }

    use {
        "mfussenegger/nvim-dap",
        config = reqmod("dap").config(),
    }

    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
        },
    }

    use "theHamsta/nvim-dap-virtual-text"

    --- git
    use {
        "lewis6991/gitsigns.nvim",
        config = reqmod("gitsigns").config(),
    }

    use {
        "tpope/vim-fugitive",
        setup = reqmod("fugitive").config(),
    }

    --- lsp
    use {
        "neovim/nvim-lspconfig",
        config = reqmod("lsp").config(),
    }

    use {
        "williamboman/nvim-lsp-installer",
        requires = {
            "neovim/nvim-lspconfig"
        },
    }

    use {
        "folke/lua-dev.nvim",
        config = function()
            require("lua-dev").setup()
        end
    }

    use "Hoffs/omnisharp-extended-lsp.nvim"

    --- miscellaneous
    use "andymass/vim-matchup"

    use {
        "b3nj5m1n/kommentary",
        config = function()
            require("kommentary.config").use_extended_mappings()
        end,
    }

    use {
        "Gelio/firenvim",
        branch = "fix-msgpack-decoding",
        disable = true,
        run = function()
            vim.fn["firenvim#install"](0)
        end,
    }

    use {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup {
                easing_function = "circular",
                mappings = { '<C-u>', '<C-d>', 'zt', 'zz', 'zb' },
            }
        end,
        disable = true,
    }

    use {
        "kyazdani42/nvim-tree.lua",
        config = reqmod("nvim-tree").config(),
        requires = {
            "kyazdani42/nvim-web-devicons"
        },
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
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup()
        end,
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
    }

    use "tpope/vim-eunuch"

    use "tpope/vim-repeat"

    use "tpope/vim-surround"

    use {
        "gbprod/substitute.nvim",
        config = reqmod("substitute").config(),
    }
    use {
        "akinsho/toggleterm.nvim",
        config = reqmod("toggleterm").config(),
    }

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end
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
        config = reqmod("undotree").config(),
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
    }

    use "kazhala/close-buffers.nvim"

    use {
        "moll/vim-bbye",
        config = reqmod("bbye").config(),
    }

    use {
        "rcarriga/nvim-notify",
        config = reqmod("notify").config(),
    }

    use {
        "wakatime/vim-wakatime",
        disable = true,
    }

    use {
        "ggandor/lightspeed.nvim",
        disable = true,
    }

    --- neorg
    use {
        "nvim-neorg/neorg",
        config = reqmod("neorg").config() 
        --[[ setup = function (),
        require("usr.modulesneorg").setup()
        end ]]
    }

    use "nvim-neorg/neorg-telescope"

    --- snippets
    use {
        "L3MON4D3/LuaSnip",
        config = reqmod("luasnip").config(),
        disable = false,
    }

    use "rafamadriz/friendly-snippets"

    --- telescope
    use {
        "nvim-telescope/telescope.nvim",
        config = reqmod("telescope").config(),
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
        config = reqmod("treesitter").config(),
        run = ":TSUpdate",
    }

    --- visual
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
        "feline-nvim/feline.nvim",
        config = reqmod("feline").config(),
        requires ={
            "stevearc/aerial.nvim",
        },
    }

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
end)
