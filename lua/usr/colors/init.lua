local M = {}

M.setup = function()
    if niscolas.settings.use_transparency then
        vim.api.nvim_set_hl(0, "Normal", {guibg = NONE, ctermbg = NONE})
    end

    vim.opt.termguicolors = true
    vim.opt.background = "dark"

    local colorscheme_name = niscolas.settings.colorscheme_name
    local colorscheme_module_path = "usr.colors.schemes." .. colorscheme_name
    local colorscheme_ok, colorscheme = pcall(require, colorscheme_module_path)

    -- vim.cmd("silent! colorscheme " .. colorscheme_name)

    if colorscheme_ok then
        niscolas.colorscheme = colorscheme
    end
end

M.load_colorscheme = function()
    if niscolas.colorscheme then
        niscolas.colorscheme.setup()
    end
end

return M
