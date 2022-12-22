local nvim_treesitter_configs_ok, nvim_treesiter_configs = pcall(require, "nvim-treesitter.configs")

if not nvim_treesitter_configs_ok then
    return
end

nvim_treesiter_configs.setup {
    ensure_installed = {
        "c_sharp",
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
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@class.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
            },
        },
    },
}
