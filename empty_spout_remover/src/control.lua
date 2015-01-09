require "defines"
--[[Debug Functions. Credit to Dysoch]]--
debug_master = true -- Master switch for debugging, shows most things!
debug_ontick = false -- Ontick switch for debugging, shows all ontick event debugs
debug_chunks = false -- shows the chunks generated with this on
function debug(str)
  if debug_master then
    PlayerPrint(str)
  end
end

function PlayerPrint(message)
  for _,player in pairs(game.players) do
    player.print(message)
  end
end
--[[/debug]]--

local minDistance = 20 -- minimum blocks between two empty oil spouts
local maxSpoutsInArea = 1
local debug = true
glob.pumpjacks.lastAreaId = -1

--[[This adds spouts to table when player places pumpjack]]--
game.onevent(defines.events.onbuiltentity, function(event)
	if(event.entity.name == string.match("^pumpjack")) then
  	debug("lastAreaId: " + glob.pumpjacks.lastAreaId)
    local scan = game.findentitiesfiltered({area = {{event.position.x + minDistance, event.position.y + minDistance}, {event.position.x - minDistance, event.position.y - minDistance}}, name="crude-oil"})
    if(scan != nil) then
      glob.pumpjacks.lastAreaId += 1
      glob.pumpjacks[glob.pumpjacks.lastAreaId] = scan
      
      debug(glob.pumpjacks[glob.pumpjacks.lastAreaId])
    end
	end
end)

game.onevent(defines.events.ontick, function(event)
  glob.currentSpout = glob.pumpjacks[glob.pumpjacks.lastAreaId]
end)

--[[
local oilPerChunk = 1
  --[Oil]--
  local oilCount = 0
  for _,ore in pairs(game.findentitiesfiltered({area = {{event.area.lefttop.x, event.area.lefttop.y}, {event.area.rightbottom.x, event.area.rightbottom.y}}, name="crude-oil"})) do
    oilCount = oilCount + 1
    if oilCount>oilPerChunk then
      ore.destroy()
    else
      ore.amount = math.random(125000, 250000)
    end
]]--