local game = require("src.game")

function love.load()
	love.graphics.setBackgroundColor(1, 1, 1) -- White
	require("src.splash").setSplash()
	game.load()
end

function love.draw()
	game.draw()
end

function love.mousepressed(x, y, button)
	myButton:mousepressed(x, y, button)
end

local splash = require("src.splash")
local timer = 0
local interval = 3
function love.update(dt)
	timer = timer + dt
	if timer >= interval then
		splash.setSplash()
		timer = 0
	end
	game.update()
end

function love.quit()
	game.cleanup()
end
