local M = {}

local neorg_callbacks = require("neorg.callbacks")

local function setup_telescope()
    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        keybinds.map_event_to_mode("norg", {
            n = {
                { "<leader>nga", "core.integrations.telescope.find_aof_tasks" },
                { "<leader>ngc", "core.integrations.telescope.find_context_tasks" },
                { "<leader>ngo", "core.integrations.telescope.find_aof_project_tasks" },
                { "<leader>ngp", "core.integrations.telescope.find_project_tasks" },
                { "<leader>nf", "core.integrations.telescope.insert_file_link" },
                { "<leader>nh", "core.integrations.telescope.search_headings" },
                { "<leader>nl", "core.integrations.telescope.insert_link" },
                { "<leader>np", "core.integrations.telescope.find_linkable" },
            },

            i = {},
        }, {
            silent = true,
            noremap = true,
        })
    end)
end

M.setup = function()
    setup_telescope()
end

return M
