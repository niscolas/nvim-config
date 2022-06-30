vim.opt.termguicolors = true
vim.opt.background = "dark"

local load_colorscheme = function ()
    local colorscheme_ok, colorscheme = pcall(
        require, "usr.colors.schemes." .. niscolas.settings.colorscheme)

    if not colorscheme_ok then
        return
    end

    niscolas.colors = colorscheme.colors
    colorscheme.setup()
end

load_colorscheme()
