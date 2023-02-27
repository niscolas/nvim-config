return {
    icon = niscolas.icons.directory,
    provider = function()
        return fn.getcwd()
    end,
}
