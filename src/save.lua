local save = {}
local saveFile = "save.txt"
local saveDir = love.filesystem.getSaveDirectory() .. "/save_data/"
local savePath = saveDir .. saveFile

function save.load()
    local file, err = love.filesystem.read(savePath)
    if file then
        return tonumber(file) or 0
    else
        return 0
    end
end

function save.save()
    local player = require("src.player")
    local data = tostring(player.money)

    -- Ensure the directory exists
    if not love.filesystem.getInfo(saveDir) then
        love.filesystem.createDirectory(saveDir)
    end

    local success, err = love.filesystem.write(savePath, data)
    if not success then
        print("Error saving data: " .. err)
    end
end

return save
