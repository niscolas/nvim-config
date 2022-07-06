local aerial = require("aerial")
local devicon = require("nvim-web-devicons")
local usr_feline_util = require("usr.modules.feline.util")

-- Format the list representing the symbol path
-- Grab it from https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua
local function format_symbols(symbols, depth, separator, icons_enabled)
    local parts = {}
    depth = depth or #symbols

    if depth > 0 then
        symbols = { unpack(symbols, 1, depth) }
    else
        symbols = { unpack(symbols, #symbols + 1 + depth) }
    end

    for _, symbol in ipairs(symbols) do
        if icons_enabled then
            table.insert(parts, symbol.icon .. symbol.name)
        else
            table.insert(parts, symbol.name)
        end
    end

    return table.concat(parts, separator)
end

local function get_symbol_path()
    -- Get a list representing the symbol path by aerial.get_location (see
    -- https://github.com/stevearc/aerial.nvim/blob/master/lua/aerial/init.lua#L127),
    -- and format the list to get the symbol path.
    -- Grab it from
    -- https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua#L89
    local symbols = aerial.get_location(true)
    local symbol_path = format_symbols(symbols, nil, " > ", true)
    return symbol_path == "" and "..." or symbol_path
end

local get_file_name = function()
    return vim.fn.expand("%:t")
end

local function get_file_icon_and_name()
    local filename = get_file_name()
    local file_icon, file_icon_color = devicon.get_icon_color_by_filetype(vim.bo.filetype, { default = true })
    return file_icon .. " " .. filename
end

local function get_modified()
    local modified = vim.api.nvim_eval_statusline("%m", {}).str
    return modified == "" and "" or modified
end

local get_result_for_inactive_buffertype = function()
    local default_prefix = " "

    for _, filetype in pairs(usr_feline_util.force_inactive.filetypes) do
        if (vim.bo.filetype == filetype) then
            return true, default_prefix .. filetype:upper()
        end
    end

    for _, buftype in pairs(usr_feline_util.force_inactive.buftypes) do
        if (vim.bo.buftype == buftype) then
            return true, default_prefix .. buftype:upper()
        end
    end

    return false
end

local provider = function()
    local is_inactive_buftype, result = get_result_for_inactive_buffertype()

    if is_inactive_buftype then
        return result
    end

    local dir_with_icon = " " .. vim.fn.expand("%:~:.:h")
    local file_with_icon = get_file_icon_and_name()
    local modified = get_modified()
    local symbol_path = get_symbol_path()

    return dir_with_icon ..
        " > " ..
        file_with_icon ..
        modified ..
        " > " ..
        symbol_path
end

-- Set highlight group for winbar
--[[ vim.api.nvim_create_augroup("winbar", {})
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    group = "winbar",
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "WinBar", { link = "CursorLineNr" })
        vim.api.nvim_set_hl(0, "WinBarNC", { link = "CursorLineNr" })
    end,
}) ]]

return provider
