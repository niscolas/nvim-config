require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "c_sharp" ,
        "lua",
        "norg",
        "vim"
    },
    highlight = {
        enable = true,
        disable = { "vim" },
        additional_vim_regex_highlighting = false,
    },
    matchup = {
        enable = true,
    }
}

