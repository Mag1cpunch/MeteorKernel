local pylua = {}
pylua.input = function(prompt)
    term.write(prompt)
    local i = read()
    return i
end
pylua.eval = function(prompt)
    loadstring(prompt)
end
pylua.exec = function(path)
    local file = fs.open(path, "r")
    local data = file.readAll()
    file.close()
    loadstring(data)
end
return pylua