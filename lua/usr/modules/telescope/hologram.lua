local previewers = require("telescope.previewers")
local usr_core_util = require("usr.core.util")

local M = {}

local is_hologram_preview = false
local support_filetype = { "png" } -- TODO: Support jpg, jpeg, webp, avif
local hologram_image = nil
local last_file_path = "" -- TODO: Cache file path to stop hologram reload image

local cache_win_position = false
local hologram_row = 0
local hologram_col = 0
local preview_win_position = 0
local current_win_position = 0
-- local preview_win_height = 0
-- local preview_win_width = 0

local is_support_filetype = function(filetype)
    return vim.tbl_contains(support_filetype, filetype)
end

local delete_hologram = function()
    hologram_image:delete { free = true }
    is_hologram_preview = false
end

local set_hologram_row_col = function(opts)
    if not cache_win_position then
        preview_win_position = api.nvim_win_get_position(opts.winid)
        current_win_position = api.nvim_win_get_position(0)
        -- preview_win_height = api.nvim_win_get_height(opts.winid)
        -- preview_win_width = api.nvim_win_get_width(opts.winid)

        cache_win_position = true
    end

    local cursor_win_position = api.nvim_win_get_cursor(0)
    hologram_row = preview_win_position[1]
        - current_win_position[1]
        - cursor_win_position[1]
        + 1
    hologram_col = preview_win_position[2]
        - current_win_position[2]
        - cursor_win_position[2]
        + 2
end

local create_hologram = function(file_path)
    hologram_image = require("hologram.image"):new(file_path, {})
    hologram_image:display(hologram_row, hologram_col, 0, {})

    is_hologram_preview = true
end

M.buffer_previewer_maker = function(file_path, bufnr, opts)
    -- NOTE: Clear image when preview other file
    if is_hologram_preview and last_file_path ~= file_path then
        delete_hologram()
    end

    last_file_path = file_path

    local filetype = usr_core_util.get_file_extension(file_path)
    if is_support_filetype(filetype) then
        set_hologram_row_col(opts)

        create_hologram(file_path)
    else
        previewers.buffer_previewer_maker(file_path, bufnr, opts)
    end
end

M.teardown = function(_)
    if is_hologram_preview then
        delete_hologram()
    end
end

return M
