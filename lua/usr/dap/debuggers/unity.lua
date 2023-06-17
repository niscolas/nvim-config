local dap = require("dap")
local usr_dap_core = require("usr.dap.core")

local debugger_path = usr_dap_core.install_path .. "/unity-debug"

dap.adapters.unity = {
    type = "executable",
    command = "mono",
    args = { debugger_path .. "/extension/bin/UnityDebug.exe" },
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
