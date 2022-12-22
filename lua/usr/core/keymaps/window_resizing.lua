local opts = { silent = true }
local resize_multiplier = 0.1

local get_horizontal_resize_amount = function()
    local resize_amount = vim.go.lines * resize_multiplier
    return resize_amount
end

local horizontal_resize = function(amount)
    vim.cmd("resize " .. amount)
end

local horizontal_increase = function()
    horizontal_resize("+" .. get_horizontal_resize_amount())
end

local horizontal_decrease = function()
    horizontal_resize("-" .. get_horizontal_resize_amount())
end

local get_vertical_resize_amount = function()
    local resize_amount = vim.go.columns * resize_multiplier
    return resize_amount
end

local vertical_resize = function(amount)
    vim.cmd("vertical resize " .. amount)
end

local vertical_increase = function()
    vertical_resize("+" .. get_vertical_resize_amount())
end

local vertical_decrease = function()
    vertical_resize("-" .. get_vertical_resize_amount())
end

vim.keymap.set("n", ",j", horizontal_decrease, opts)
vim.keymap.set("n", ",k", horizontal_increase, opts)
vim.keymap.set("n", ",h", vertical_decrease, opts)
vim.keymap.set("n", ",l", vertical_increase, opts)
