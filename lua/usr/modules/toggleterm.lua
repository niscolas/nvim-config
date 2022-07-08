local M = {}

local default_highlights = {
    NormalFloat = {
        link = "Normal"
    },
}

local highlights = niscolas.colorscheme.toggleterm_highlights or
                   default_highlights

M.config = function()
    require "toggleterm".setup {
        direction = "float",
        float_opts = { -- The border key is *almost* the same as 'nvim_open_win'
            -- see :h nvim_open_win for details on borders however
            -- the 'curved' border is a custom border type
            -- not natively supported but implemented in this plugin.
            border = "curved",
        },
        highlights = highlights,
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "float" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-\><c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        persist_size = true,
        close_on_exit = true, -- close the terminal window when the process exits
    }
end

return M
