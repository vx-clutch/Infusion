local game = require("src.game")

function love.load()
	love.graphics.setBackgroundColor(1, 1, 1) -- White
	game.load()
end

function love.draw()
	game.draw()
end

function love.update()
	game.update()
end

function love.quit()
	game.cleanup()
end
