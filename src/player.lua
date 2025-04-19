local player = {}
player.money = 0

function player.add(k)
	player.money = player.money + k
end

function player.sub(k)
	player.money = player.money - k
end

function player.set(k)
	player.money = k
end

return player
