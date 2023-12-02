local netutils = {}
package.path = package.path .. ";/MeteorOS/lib/?.lua"
local pylua = require("pylua")
netutils.openNetwork = function()
    rednet.open("back")  -- Specify the side where your modem is connected
end

netutils.closeNetwork = function()
    rednet.close("back")  -- Specify the side where your modem is connected
end
netutils.NetShell = function()
    if pcid == nil then
        print("[INFO] Your pc id is: " .. os.getComputerID())
        local i = pylua.input("Enter pc id you want to manage: ")
        if i == nil then
            return
        end
        pcid = tonumber(i)
    end

    local input = pylua.input("NetShell")
    if input == "clear" then
        term.clear()
        print("[INFO] Your pc id is: " .. os.getComputerID())
        NetShell()
    elseif input == "close" then
        if rednet.isOpen("back") then
            rednet.send(pcid, "close")
            netutils.closeNetwork()
        else
            print("Connection is not open")
        end
        NetShell()
    elseif input == "open" then
        if not rednet.isOpen("back") then
            netutils.openNetwork()
        else
            print("Connection is already open")
        end
        NetShell()
    elseif input == "exit" then
        if rednet.isOpen("back") then
            rednet.send(pcid, "close")
            netutils.closeNetwork()
        end
        return
    elseif input == "help" then
        print("List of commands:")
        print(" exit - Exit from the program")
        print(" clear - Clear screen")
        print(" rs - Run the RS shell")
        print(" open - Open the network")
        print(" close - Close the network")
        print(" update-server - Update the server")
        NetShell()
    else
        NetShell()
    end
end