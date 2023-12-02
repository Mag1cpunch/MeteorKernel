kernel = {}
kernel.verifyFS = function()
    if not fs.exists("/MeteorOS/lib") then
        fs.makeDir("/MeteorOS/lib")
        shell.run("cd /MeteorOS/lib")
    end
    if not fs.exists("/MeteorOS/system/x86") then
        fs.makeDir("/MeteorOS/system/x86")
        fs.makeDir("/MeteorOS/system/x86/core")
        shell.run("cd /MeteorOS/system/x86/core")
    end
end
kernel.updateOS = function()
    if fs.exists("/MeteorOS") then
        fs.delete("/MeteorOS")
    end
end
kernel.boot = function()
    print("Verifying File System...")
    kernel.verifyFS()
    print("[ OK ] Verified File System")
    print("Booting Up MeteorOS...")
    shell.run("/MeteorOS/system/x86/core/shell.lua")
end
kernel.shutdown = function()
    os.shutdown("")
end
kernel.reboot = function()
    os.reboot()
end
return kernel