return {
    icon = niscolas.icons.directory .. " ",
    provider = function()
        local result = fn.getcwd()
        local home_dir = os.getenv("HOME")

        if home_dir then
            result = string.gsub(result, home_dir, "~")
        end

        return result
    end,
}
