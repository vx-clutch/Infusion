local game = {}
local player = require("src.player")
local save = require("src.save")

game.state = {}

function game.load()
	player.set(save.load())
	font = love.graphics.newFont(56)
	shopkeep = love.graphics.newImage("src/assets/shopkeep.png")
end

function game.draw()
	local width = love.graphics.getWidth()
	local height = love.graphics.getHeight()

	-- menu bar
	love.graphics.setColor(0.5, 0.5, 0.5)
	love.graphics.rectangle("fill", 0, 0, width, height / 5)

	-- shopkeep
	love.graphics.draw(shopkeep, width / 25, height / 25, 0, 2, 2)

	-- money
	love.graphics.setColor(0, 0, 0)
	love.graphics.setFont(font)
	local text = tostring(player.money)
	local textWidth = font:getWidth(text)
	local x = width - textWidth - 10
	local y = (height / 5 - font:getHeight()) / 2
	love.graphics.print(text, x, y)
end

function game.update()
	love.window.setTitle(tostring(player.money))
end

function game.cleanup()
	save.save()
end

return game
