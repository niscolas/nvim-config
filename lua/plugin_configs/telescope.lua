local M = {}

M.config = function()
    require("telescope").setup {
        defaults = {
            file_ignore_patterns = {
                ".git",
                "node_modules",
                "[Ll]ibrary",
                "**/*.asmdef",
                "**/*.asset",
                "**/*.bank",
                "**/*.csproj",
                "**/*.jpg",
                "**/*.jpeg",
                "**/*.mat",
                "**/*.meta",
                "**/*.mixer",
                "**/*.png",
                "**/*.otf",
                "**/*.physicMaterial",
                "**/*.physicsMaterial",
                "**/*.prefab",
                "**/*.preset",
                "**/*.ttf",
                "**/*.unity",
                "**/*.wav"
            }
        }
    }

    vim.keymap.set("n", "<c-p>", function() require("telescope.builtin").find_files() end)
    vim.keymap.set("n", "<c-f>", function() require("telescope.builtin").live_grep() end)
    vim.keymap.set("n", "<leader>td", function() require("telescope.builtin").lsp_definitions() end)
    vim.keymap.set("n", "<leader>tr", function() require("telescope.builtin").lsp_references() end)
    vim.keymap.set("n", "<leader>ti", function() require("telescope.builtin").lsp_implementations() end)
    vim.keymap.set("n", "<leader>ta", function() require("telescope.builtin").lsp_code_actions() end)
    vim.keymap.set("n", "<leader>twd", function() require("telescope.builtin").lsp_workspace_diagnostics() end)
    vim.keymap.set("n", "<leader>tp", function() require("telescope").extensions.project.project{} end)
end

return M
