package.path = package.path .. ";/MeteorOS/system/?.lua"
local kernel = require("kernel")
kernel.boot()