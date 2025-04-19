local save = {}

local saveFile = "save.csv"
local saveDir = love.filesystem.getSaveDirectory() .. "/save_data/"
local savePath = saveDir .. saveFile

function save.save()
    local player = require("src.player")
    local data = {
        tostring(player.tea),
        tostring(player.leaves),
    }

    -- Convert to CSV string
    local csvLine = table.concat(data, ",")

    if not love.filesystem.getInfo(saveDir) then
        love.filesystem.createDirectory(saveDir)
    end

    local success, err = love.filesystem.write(savePath, csvLine)
    if not success then
        print("Error saving data: " .. err)
    end
end

function save.load()
    if not love.filesystem.getInfo(savePath) then
        print("No save file found.")
        return
    end

    local content, size = love.filesystem.read(savePath)
    if not content then
        print("Error reading save file.")
        return
    end

    local fields = {}
    for value in string.gmatch(content, "([^,]+)") do
        table.insert(fields, value)
    end

    local player = require("src.player")
    player.tea = tonumber(fields[1]) or 0
    player.leaves = tonumber(fields[2]) or 0
end

return save
