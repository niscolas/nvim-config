usr_require("modules.util").try_bootstrap_packer()

local usr_packer = usr_module_require("packer")

local impatient_ok, impatient = try_require("impatient")
if impatient_ok then
    impatient.enable_profile()
end

usr_packer.setup()
