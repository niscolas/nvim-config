local M = {}

M.default_left_separator = " "
M.default_right_separator = " "

M.force_inactive = {
    filetypes = {},
    bufnames = {}
}

M.theme = niscolas.colorscheme.feline_theme or {}

M.create_full_component = function(component_pieces)
    local full_component = {}

    for _, component_piece in ipairs(component_pieces) do
        full_component = vim.tbl_deep_extend("force", full_component, component_piece)
    end

    return full_component
end

M.process_component_sections = function(raw_components_sections)
    local result = {}

    for i, component_section in ipairs(raw_components_sections) do
        table.insert(result, {})

        for _, component_pieces in ipairs(component_section) do
            local full_component = M.create_full_component(component_pieces)
            table.insert(result[i], full_component)
        end
    end

    return result
end

return M
