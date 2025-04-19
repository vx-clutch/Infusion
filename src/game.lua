local game = {}
local player = require("src.player")
local save = require("src.save")
local Button = require("src.button")

game.state = {}

function game.load()
	-- Set up the player's state
	save.load()

	-- Set up font and shopkeep image
	game.font = love.graphics.newFont(56)
	game.shopkeep = love.graphics.newImage("src/assets/shopkeep.png")

	-- Set up the button
	myButton = Button.new(
		love.graphics.getWidth() / 50,
		love.graphics.getHeight() / 5 + love.graphics.getHeight() / 25,
		"Steep",
		function()
			player.tea = player.tea + 1
		end
	)
end

function game.draw()
	-- Get screen width and height
	local Width = love.graphics.getWidth()
	local Height = love.graphics.getHeight()
	local BarHeight = Height / 5

	-- Menu bar
	love.graphics.setColor(0.5, 0.5, 0.5)
	love.graphics.rectangle("fill", 0, 0, Width, BarHeight)

	-- Shopkeep
	love.graphics.draw(game.shopkeep, Width / 25, Height / 25, 0, 2, 2)

	-- Money display
	love.graphics.setColor(0, 0, 0)
	love.graphics.setFont(game.font)
	local text = tostring(player.tea)
	local textWidth = game.font:getWidth(text)
	local x = Width - textWidth - 10
	local y = (BarHeight - game.font:getHeight()) / 2
	love.graphics.print(text, x, y)

	-- Draw button
	myButton:draw()
end

function game.mousepressed(x, y, button)
	game.myButton:mousepressed(x, y, button)
end

function game.update(dt)
end

function game.cleanup()
	-- Save the game state when cleaning up
	save.save()
end

return game
