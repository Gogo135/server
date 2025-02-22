-----------------------------------
-- Area: Temple of Uggalepih (159)
--  NPC: qm8 (???)
-- Note: Used to spawn Habetrot
-- !pos -57.434 -8.484 55.317 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, {{ xi.items.LA_THEINE_CABBAGE, 12 }}) and
        not GetMobByID(ID.mob.HABETROT):isSpawned() and
        not GetMobByID(ID.mob.HABETROT + 1):isSpawned()
    then
        -- 12 La Theine Cabbages
        local mobToSpawn = (math.random(1, 100) <= 20) and ID.mob.HABETROT or ID.mob.HABETROT + 1 -- 20% Chance to spawn Habetrot, else it's a Rumble Crawler
        npcUtil.popFromQM(player, npc, mobToSpawn)
        player:confirmTrade()
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.BITS_OF_VEGETABLE)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
