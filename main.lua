--------------------------------------------------------------------------------
-- main.lua
--------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
math.randomseed(os.time())

--------------------------------------------------------------------------------
-- Create Sample Effect
--------------------------------------------------------------------------------
local CBE = require("CBEffects.Library")

local samplesFile = io.open("samples/samples.txt", "r")
local samplesString = samplesFile:read("*a")
samplesFile:close()
local samples = {}
for s in samplesString:gmatch("(.-)\n") do samples[#samples + 1] = s end

local sampleName = samples[math.random(#samples)]

-- print("Loading sample " .. sampleName)
require("samples." .. sampleName:gsub("/", "."))
-- require("samples.ExampleEffects.Explosion1")

local t = display.newText({
	-- Manual kerning for fun and profit:
	text = "Sample: " .. sampleName,
	font = "CourierNewPSMT",
	fontSize = 30
})
t.x, t.y = display.contentCenterX, t.height * 0.5 + 10