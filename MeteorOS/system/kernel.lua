kernel = {}
kernel.verifyFS = function()
    if not fs.exists("/MeteorOS/lib") then
        fs.makeDir("/MeteorOS/lib")
    end
    if not fs.exists("/MeteorOS/lib/kernelwrapper.lua") then
        shell.run("cd /MeteorOS/lib")
        shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/lib/kernelwrapper.lua")
    end
    if not fs.exists("/MeteorOS/lib/netutils.lua") then
        shell.run("cd /MeteorOS/lib")
        shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/lib/netutils.lua")
    end
    if not fs.exists("/MeteorOS/lib/pylua.lua") then
        shell.run("cd /MeteorOS/lib")
        shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/lib/pylua.lua")
    end
    if not fs.exists("/MeteorOS/system/x86") then
        fs.makeDir("/MeteorOS/system/x86")
    end
    if not fs.exists("/MeteorOS/system/x86/core") then
        fs.makeDir("/MeteorOS/system/x86/core")
    end
    if not fs.exists("/MeteorOS/system/x86/core/shell.lua") then
        shell.run("cd /MeteorOS/system/x86/core")
        shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/system/x86/core/shell.lua")
    end
    shell.run("cd /")
end
kernel.shutdown = function()
    os.shutdown("")
end
kernel.reboot = function()
    os.reboot()
end
kernel.updateOS = function()
    if fs.exists("/MeteorOS") then
        fs.delete("/MeteorOS")
        fs.delete("/startup.lua")
    end
    fs.makeDir("/MeteorOS/lib")
    fs.makeDir("/MeteorOS/system/x86")
    fs.makeDir("/MeteorOS/system/x86/core")
    shell.run("cd /MeteorOS/lib")
    shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/lib/kernelwrapper.lua")
    shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/lib/netutils.lua")
    shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/lib/pylua.lua")
    shell.run("cd /MeteorOS/system/x86/core")
    shell.run("wget https://raw.githubusercontent.com/Mag1cpunch/MeteorKernel/main/MeteorOS/system/x86/core/shell.lua")
    shell.run("cd /")
    kernel.reboot()
end
kernel.boot = function()
    print("Verifying File System...")
    kernel.verifyFS()
    print("[ OK ] Verified File System")
    print("Booting Up MeteorOS...")
    shell.run("/MeteorOS/system/x86/core/shell.lua")
end
return kernel