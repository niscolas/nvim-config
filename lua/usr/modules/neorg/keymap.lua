local M = {}

local neorg_callbacks = require("neorg.callbacks")

local function setup_telescope()
    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        keybinds.map_event_to_mode("norg", {
            n = {
                { "<leader>nta", "core.integrations.telescope.find_aof_tasks" },
                { "<leader>ntc", "core.integrations.telescope.find_context_tasks" },
                { "<leader>ntf", "core.integrations.telescope.insert_file_link" },
                { "<leader>nth", "core.integrations.telescope.search_headings" },
                { "<leader>ntl", "core.integrations.telescope.insert_link" },
                { "<leader>nto", "core.integrations.telescope.find_aof_project_tasks" },
                { "<leader>ntp", "core.integrations.telescope.find_linkable" },
                { "<leader>ntp", "core.integrations.telescope.find_project_tasks" },
                { "<leader>nc", "core.gtd.base.capture" },
                { "<leader>ne", "core.gtd.base.edit" },
                { "<leader>nv", "core.gtd.base.views" },
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
