local notify_ok, notify = try_require("notify")

if not notify_ok then
    return
end

print("loading notify")

notify.setup{
    background_colour = "#000000",
}
vim.notify = notify

usr_module_require("notify.recipes")
