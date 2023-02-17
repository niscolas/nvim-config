local M = {}

M.ignored_extensions = {
    "anim",
    "asmdef",
    "asset",
    "bank",
    "bytes",
    "clip",
    "controller",
    "csproj",
    "dll",
    "exe",
    "fbx",
    --[[ "jpg",
    "jpeg", ]]
    "lightning",
    "mat",
    "meta",
    "mixer",
    "mp3",
    "mp4",
    -- "png",
    "otf",
    "physicMaterial",
    "physicsMaterial",
    "prefab",
    "preset",
    "ttf",
    "ttf",
    "unity",
    "wav",
    "zip",
}

M.get_file_ignore_patterns = function()
    local file_ignore_patterns = {
        ".git/",
        "node_modules",
        "[Ll]ibrary",
    }

    for _, extension in ipairs(M.ignored_extensions) do
        table.insert(file_ignore_patterns, "%." .. extension .. "$")
        table.insert(
            file_ignore_patterns,
            "%." .. string.upper(extension) .. "$"
        )
        table.insert(
            file_ignore_patterns,
            "%." .. string.lower(extension) .. "$"
        )
    end

    return file_ignore_patterns
end

return M
