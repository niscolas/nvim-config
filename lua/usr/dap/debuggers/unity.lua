local dap_ok, dap = pcall(require, "dap")
local dap_core_ok, dap_core = pcall(require, "usr.dap.core")

if not dap_ok or not dap_core_ok then
    return
end

local debugger_path = dap_core.data.install_path .. "unity/"

dap.adapters.unity = {
    type = "executable",
    command = "mono",
    args = { debugger_path .. "extension/bin/UnityDebug.exe" },
    name = "Unity Editor",
}

dap.configurations.cs = {
    {
        name = "Unity Editor",
        type = "unity",
        request = "launch",
        path = "Library/EditorInstance.json",
        __exceptionOptions = {},
    },
}
