local M = {}

M.setup_keymap = function()
    new_keymap(
        "n",
        "<Leader>e",
        require("oil").open,
        { desc = "Open Oil ([E]xplorer)" }
    )
end

M.setup = function()
    require("oil").setup {
        columns = {
            "mtime",
            "icon",
            -- "permissions",
            -- "size",
        },
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-v>"] = "actions.select_vsplit",
            ["<C-s>"] = "actions.select_split",
            ["<C-j>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["g."] = "actions.toggle_hidden",
            ["+"] = {
                callback = function()
                    local oil = require("oil")
                    local file_path = oil.get_current_dir()
                        .. "/"
                        .. oil.get_cursor_entry().name

                    if fn.executable("mimeo") then
                        fn.system { "mimeo", file_path, " &" }
                    elseif fn.executable("xdg-open") then
                        fn.system { "xdg-open", file_path, " &" }
                    end
                end,
            },
        },
        use_default_keymaps = false,
        view_options = {
            show_hidden = true,
        },
    }

    M.setup_keymap()
end

return M
