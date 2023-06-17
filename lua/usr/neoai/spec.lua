local config = require("usr.neoai")

return {
    "Bryley/neoai.nvim",
    cmd = {
        "NeoAI",
        "NeoAIClose",
        "NeoAIContext",
        "NeoAIContextClose",
        "NeoAIContextOpen",
        "NeoAIInject",
        "NeoAIInjectCode",
        "NeoAIInjectContext",
        "NeoAIInjectContextCode",
        "NeoAIOpen",
        "NeoAIToggle",
    },
    config = config.setup,
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            config.keymap.generate_commit_msg.keys,
            desc = config.keymap.generate_commit_msg.desc,
        },
        {
            config.keymap.summarize_text.keys,
            desc = config.keymap.summarize_text.desc,
        },
    },
}
