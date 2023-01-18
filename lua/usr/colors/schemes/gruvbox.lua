local M = {}

M.before_plugin = function()
end

M.after_plugin = function()
    require("gruvbox").setup {
        contrast = "soft", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
    }
end

return M
