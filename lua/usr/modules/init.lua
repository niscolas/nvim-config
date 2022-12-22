require("usr.util.plugins").try_bootstrap_packer()

local usr_packer_ok, usr_packer = try_usr_module_require("packer")

if not usr_packer_ok then
    return
end

local impatient_ok, impatient = try_require("impatient")
if impatient_ok then
    impatient.enable_profile()
end

usr_packer.setup()
