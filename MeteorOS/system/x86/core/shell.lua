local monitor
package.path = package.path .. ";/MeteorOS/lib/?.lua"
local pylua = require("pylua")
local netutils = require("netutils")
local kernel = require("kernelwrapper")
local cdir = "/"
local function handleInput()
    term.clear()
    print("[[ -------------------------------- ]]")
    print("[[ Aurora Interactive Shell Ver 1.0 ]]")
    print("[[ -------------------------------- ]]")
    print()
    while true do
        local input = pylua.input(cdir..":root$ ")
        if input == "luarun" then
            local script = pylua.input("Enter path to Lua script: ")
            if script == nil or script == "" then
                print("Path not specified")
            elseif script ~= nil or script ~= "" and fs.exists(script) then
                pylua.exec(script)
            else
                print("Invalid script path: "..script)
            end
        elseif input == "update" then
            kernel.updateOS()
        elseif input == "clear" then
            term.clear()
            print("[[ -------------------------------- ]]")
            print("[[ Aurora Interactive Shell Ver 1.0 ]]")
            print("[[ -------------------------------- ]]")
            print()
        elseif input == "netshell" then
            netutils.NetShell()
        end
    end
end
handleInput()