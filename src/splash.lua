local splash = {}

math.randomseed(os.time())
local messages = {
	"Steep dreams are made of tea...",
	"Infusing productivity!",
	"Brew it and they will come.",
	"Boiling point reached!",
	"Time for a cuppa clicka.",
	"Leaves of legacy.",
	"Infinite infusion in progress...",
	"A watched pot *does* earn leaves.",
	"Serving steeped greatness!",
	"Click fast, sip slow.",
	"Zen and the art of tea farming.",
	"Harvesting hotness...",
	"Brewtally efficient.",
	"Oolong and thanks for all the clicks!",
	"Pour decisions lead to progress.",
	"Cha-ching!",
	"Simmer down, profits up.",
	"Tea-rific things ahead!",
	"One leaf to steep them all.",
	"Tea time is grind time.",
	"Global leaf warming in progress.",
	"Now with extra antioxidants!",
	"Faster than a kettle whistle.",
	"No sugar, just stats.",
	"You can't rush perfection. But you can automate it.",
	"The leaves are listening...",
	"Big leaves. Bigger dreams.",
	"Hot leaf juice supremacy.",
	"From kettle to kingdom!",
	"Keep calm and steep on.",
	"You had me at 'hello, world' and tea.",
	"This game is steeped in tradition.",
	"Overflow error: too much tea.",
	"Reality is a construct of caffeine.",
}

function splash.setSplash()
	love.window.setTitle(messages[math.random(#messages)])
end

return splash
