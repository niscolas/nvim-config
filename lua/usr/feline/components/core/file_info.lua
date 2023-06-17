local feline_cursor_provider = require("feline.providers.cursor")

return {
    provider = function()
        local encoding = vim.bo.fileencoding:upper()
        local format = vim.bo.fileformat:upper()
        local position = feline_cursor_provider.position({}, {})

        return niscolas.icons.info
            .. " "
            .. format
            .. " "
            .. encoding
            .. " "
            .. niscolas.icons.position
            .. " "
            .. position
    end,
}
