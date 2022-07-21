local M = {}

M.setup = function()
    vim.opt.termguicolors = true
    vim.opt.background = "dark"

    local colorscheme_ok, colorscheme = pcall(
        require, "usr.colors.schemes." .. niscolas.settings.colorscheme)

    if not colorscheme_ok then
        return
    end

    niscolas.colorscheme = colorscheme
end

M.load_colorscheme = function ()
    if niscolas.colorscheme then
        niscolas.colorscheme.setup()
    end
end

return M
