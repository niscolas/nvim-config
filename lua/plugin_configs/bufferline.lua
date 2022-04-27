require "bufferline".setup {
    highlights = {
        fill = {
            guibg = "Black",
        },
        buffer_visible = {
            guifg = "normal_fg",
            guibg = "normal_bg",
        },
        separator_selected = {
            guifg = "Black",
        },
        separator_visible = {
            guifg = "Black",
        },
        separator = {
            guifg = "Black",
        },
    },
    options = {
        numbers = "none",
        left_mouse_command = "buffer %d",
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
                return vim.fn.fnamemodify(buf.name, ':t:r')
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 30,
        diagnostics = "false",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = " File Explorer",
                text_align = "center"
            }
        },
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
        -- separator_style = { '', '' }, -- | "thick" | "thin" | { 'any', 'any' },
        always_show_bufferline = true,
    },
}
