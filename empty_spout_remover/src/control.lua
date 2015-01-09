require "defines"

local minDistance = 20 -- minimum blocks between two empty oil spouts
local maxSpoutsInArea = 1
local debugMode = true
local pumpIdTemplate = "p_I"



game.onevent(defines.events.onbuiltentity, function(event)
	if(event.entity.name == string.match("^pumpjack")) then
    glob.pumpjacks
	end
end)


--local oilPerChunk = 1
--  --[Oil]--
--  local oilCount = 0
--  for _,ore in pairs(game.findentitiesfiltered({area = {{event.area.lefttop.x, event.area.lefttop.y}, {event.area.rightbottom.x, event.area.rightbottom.y}}, name="crude-oil"})) do
--    oilCount = oilCount + 1
--    if oilCount>oilPerChunk then
--      ore.destroy()
--    else
--      ore.amount = math.random(125000, 250000)
--    end