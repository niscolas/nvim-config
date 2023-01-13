require("usr.core")
require("usr.modules.util")
usr_require("gui")

local colors = usr_require("colors")
colors.before_plugin()

usr_require("modules")

local firenvim_active = usr_module_require("plugins").check_is_firenvim_env()
if firenvim_active then
    vim.opt.laststatus = 0
end

colors.after_plugin()
