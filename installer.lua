if fs.exists("/MeteorOS") then
    fs.delete("/MeteorOS")
end
fs.makeDir("/MeteorOS")
fs.makeDir("/MeteorOS/system")
shell.run("cd /")
shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/startup.lua")
shell.run("cd /MeteorOS/system")
shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/system/kernel.lua")
fs.delete("/installer.lua")
os.reboot()
